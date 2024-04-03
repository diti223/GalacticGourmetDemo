//
//  HomeView.swift
//  GalacticGourmetDemo
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation
import SwiftUI

import SwiftUI
//import Factory
//Needle


public struct Dependencies {
    let fetchRecipesUseCase: FetchRecipesUseCase
}

public struct HomeView: View {
    public let fetchRecipesUseCase: FetchRecipesUseCase
    
    public init(fetchRecipesUseCase: FetchRecipesUseCase) {
        self.fetchRecipesUseCase = fetchRecipesUseCase
    }
    
    var mealPlanRange: DateRange {
        // Assuming today is Sunday, calculate the start of the next week
        let calendar = Calendar.current
        var components = DateComponents()
        components.weekOfYear = 1 // Move forward by one week
        
        // Calculate the start date of the next week
        guard let nextWeekStartDate = calendar.nextDate(after: Date(), matching: components, matchingPolicy: .nextTime) else {
            fatalError("Unable to calculate the start of the next week")
        }
        
        // Calculate the end date of the next week by adding 6 days to the start date
        guard let nextWeekEndDate = calendar.date(byAdding: .day, value: 6, to: nextWeekStartDate) else {
            fatalError("Unable to calculate the end of the next week")
        }
        
        // Create the DateRange for the next week
        let nextWeekRange = DateRange(start: nextWeekStartDate, end: nextWeekEndDate)
        
        return nextWeekRange
    }
    
    public var body: some View {
        TabView {
            RecipeListView(
                viewModel: RecipeListViewModel(fetchRecipesUseCase: fetchRecipesUseCase)
            )
            .tabItem {
                Label("Discover", systemImage: "magnifyingglass")
            }
            
            RecipeCreationView(
                viewModel: RecipeCreationViewModel(createRecipeUseCase: UseCase { model in
                    debugPrint(model)
                })
            )
            .tabItem {
                Label("Create", systemImage: "plus.circle")
            }
            
            //            MealPlanningView()
            MealPlanView(
                viewModel: MealPlanViewModel(
                    week: mealPlanRange,
                    createMealPlanUseCase: UseCase.debugPrintUseCase,
                    fetchMealPlanUseCase: UseCase { week in
                        debugPrint(week)
                        let recipes = try await fetchRecipesUseCase.fetchRecipes()
                        let result: [MealSlot: [Recipe]] = recipes.reduce(into: [:]) { result, element in
                            let slot = MealSlot.allCases.randomElement()!
                            result[slot] = (result[slot] ?? []) + [element]
                        }
                        
                        return MealPlan(week: mealPlanRange, meals: result)
                    },
                    updateMealPlanUseCase: UseCase.debugPrintUseCase,
                    deleteMealPlanUseCase: UseCase.debugPrintUseCase
                )
            )
                .tabItem {
                    Label("Plan", systemImage: "calendar")
                }
            
            CookingEventsView()
                .tabItem {
                    Label("Events", systemImage: "flame.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

extension UseCase where Output == Void {
    static var debugPrintUseCase: Self {
        Self { item in
            debugPrint(item)
        }
    }
}


struct DiscoverView: View {
    var body: some View {
        Text("Discover Recipes")
    }
}

struct CreateRecipeView: View {
    var body: some View {
        Text("Create Recipe")
    }
}

struct MealPlanningView: View {
    var body: some View {
        Text("Meal Planning")
    }
}

struct CookingEventsView: View {
    var body: some View {
        Text("Cooking Events")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}
