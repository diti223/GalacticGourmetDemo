//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 26.03.2024.
//

import Foundation
import Combine

class MealPlanViewModel: ObservableObject {
    @Published var mealPlan: MealPlan?
    @Published var shoppingList: ShoppingList = ShoppingList(items: [])
    private var week: DateRange
    
    private var createMealPlanUseCase: CreateMealPlanUseCase
    private var fetchMealPlanUseCase: FetchMealPlanUseCase
    private var updateMealPlanUseCase: UpdateMealPlanUseCase
    private var deleteMealPlanUseCase: DeleteMealPlanUseCase
    
    init(week: DateRange,
         createMealPlanUseCase: CreateMealPlanUseCase,
         fetchMealPlanUseCase: FetchMealPlanUseCase,
         updateMealPlanUseCase: UpdateMealPlanUseCase,
         deleteMealPlanUseCase: DeleteMealPlanUseCase) {
        self.week = week
        self.createMealPlanUseCase = createMealPlanUseCase
        self.fetchMealPlanUseCase = fetchMealPlanUseCase
        self.updateMealPlanUseCase = updateMealPlanUseCase
        self.deleteMealPlanUseCase = deleteMealPlanUseCase
    }
    
    @MainActor
    func loadMealPlan() async {
        do {
            mealPlan = try await fetchMealPlanUseCase.fetchMealPlan(for: week)
            if let meals = mealPlan?.meals.values.flatMap({ $0 }) {
                generateShoppingList(from: Array(meals))
            }
        } catch {
            // Handle errors
        }
    }
    
    func generateShoppingList(from meals: [Recipe]) {
        let shoppingItems = Set(meals.flatMap(\.ingredients)).filter({
            !$0.name.contains(try! Regex("(salt)"))
        }).map {
            ShoppingItem(
                id: UUID().uuidString,
                name: $0.name,
                quantity: $0.quantity,
                isPurchased: false
            )
        }.sorted(by: { $0.name < $1.name })
        shoppingList.items = shoppingItems
    }
    
    @MainActor
    func createMealPlan(with meals: [MealSlot: [Recipe]]) async {
        do {
            let plan = MealPlan(
                week: week,
                meals: meals
            )
            try await createMealPlanUseCase.createMealPlan(plan)
            await loadMealPlan()
        } catch {
            // Handle errors
        }
    }
    
    func updateMealPlan() async {
        guard let mealPlan = mealPlan else { return }
        do {
            try await updateMealPlanUseCase.updateMealPlan(mealPlan)
            await loadMealPlan()
        } catch {
            // Handle errors
        }
    }
    
    func deleteMealPlan() async {
        do {
            try await deleteMealPlanUseCase.deleteMealPlan(for: week)
            mealPlan = nil
            shoppingList = ShoppingList(items: [])
        } catch {
            // Handle errors
        }
    }
}
