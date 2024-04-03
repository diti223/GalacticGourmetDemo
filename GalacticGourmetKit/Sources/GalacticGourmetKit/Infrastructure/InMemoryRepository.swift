//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

class InMemoryRepository: FetchRecipesUseCase, FetchRecipeDetailUseCase, UpdateRecipeUseCase, DeleteRecipeUseCase, CreateRecipeUseCase {
    func fetchRecipes() async throws -> [Recipe] {
        recipes
    }
    
    var recipes: [Recipe] = []
    func fetchRecipeDetail(for recipeId: String) async throws -> RecipeDetail? {
        nil
    }
    
    func updateRecipe(_ recipe: Recipe) async throws {
        
    }
    
    func deleteRecipe(withId recipeId: String) async throws {
        recipes = recipes.filter { $0.id != recipeId }
    }
    
    func createRecipe(_ recipe: RecipeCreationModel) async throws {
        recipes.append(
            Recipe(
                id: UUID().uuidString,
                title: recipe.title,
                description: recipe.description ?? "''",
                ingredients: recipe.ingredients,
                steps: recipe.steps,
                cookingTime: recipe.cookingTime!,
                category: recipe.category!,
                dietaryRestrictions: recipe.dietaryRestrictions!,
                images: recipe.images
            )
        )
    }
}
