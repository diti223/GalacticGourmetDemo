//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public class InMemoryMealPlanRepository: CreateMealPlanUseCase, FetchMealPlanUseCase, UpdateMealPlanUseCase, DeleteMealPlanUseCase {
    
    private var mealPlans: [DateRange: MealPlan] = [:]
    
    public init() {}
    
    // MARK: - CreateMealPlanUseCase
    
    public func createMealPlan(_ plan: MealPlan) async throws {
        mealPlans[plan.week] = plan
    }
    
    // MARK: - FetchMealPlanUseCase
    
    public func fetchMealPlan(for week: DateRange) -> MealPlan? {
        return mealPlans[week]
    }
    
    // MARK: - UpdateMealPlanUseCase
    
    public func updateMealPlan(_ mealPlan: MealPlan) {
        mealPlans[mealPlan.week] = mealPlan
    }
    
    // MARK: - DeleteMealPlanUseCase
    
    public func deleteMealPlan(for week: DateRange) {
        mealPlans.removeValue(forKey: week)
    }
}
