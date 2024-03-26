//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation
import SwiftUI
import SwiftData

struct RecipeListView: View {
    @ObservedObject private var viewModel: RecipeListViewModel
    
    public init(viewModel: RecipeListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading recipes...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeRowView(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .task {
                await viewModel.fetchRecipes()
            }
        }
    }
}

#Preview {
    RecipeListView(
        viewModel: RecipeListViewModel(fetchRecipesUseCase: UseCase {
            [Recipe(
                id: "demo-recipe",
                title: "Vegetarian Chili",
                description: "A hearty and flavorful vegetarian chili made with a variety of beans, vegetables, and spices.",
                ingredients: [
                    Ingredient(name: "kidney beans", quantity: "1 (15 oz) can, drained and rinsed"),
                    Ingredient(name: "black beans", quantity: "1 (15 oz) can, drained and rinsed"),
                    Ingredient(name: "diced tomatoes", quantity: "1 (28 oz) can"),
                    Ingredient(name: "onion", quantity: "1, diced"),
                    Ingredient(name: "bell pepper", quantity: "1, diced"),
                    Ingredient(name: "chili powder", quantity: "2 tablespoons"),
                    Ingredient(name: "cumin", quantity: "1 tablespoon"),
                    Ingredient(name: "garlic", quantity: "3 cloves, minced"),
                    Ingredient(name: "vegetable broth", quantity: "2 cups")
                ],
                steps: [
                    "In a large pot, sauté the onion and bell pepper in olive oil until softened.",
                    "Add the garlic and cook for another minute.",
                    "Stir in the chili powder, cumin, and a pinch of salt and pepper.",
                    "Add the diced tomatoes, kidney beans, black beans, and vegetable broth.",
                    "Bring the mixture to a simmer and cook for 30 minutes, stirring occasionally.",
                    "Adjust seasoning with salt and pepper to taste."
                ],
                cookingTime: 60,
                category: .dinner,
                dietaryRestrictions: [.vegetarian, .vegan],
                images: ["vegetarian-chili.jpg"]
            )
            ]
        })
    )
}

extension UseCaseFetcher<[Recipe]>: FetchRecipesUseCase {
    public func fetchRecipes() async throws -> [Recipe] {
        try await execute()
    }
}
