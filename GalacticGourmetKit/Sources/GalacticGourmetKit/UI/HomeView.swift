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
    public var body: some View {
        TabView {
            RecipeListView(
                viewModel: RecipeListViewModel(fetchRecipesUseCase: fetchRecipesUseCase)
            )
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
            
            CreateRecipeView()
                .tabItem {
                    Label("Create", systemImage: "plus.circle")
                }
            
            MealPlanningView()
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
