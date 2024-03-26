//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol FetchRecipesUseCase {
    func fetchRecipes() async throws -> [Recipe]
}

public protocol FetchRecipeDetailUseCase {
    func fetchRecipeDetail(for recipeId: String) async throws -> RecipeDetail?
}

public protocol CreateRecipeUseCase {
    func createRecipe(_ recipe: RecipeCreationModel) async throws
}

public protocol UpdateRecipeUseCase {
    func updateRecipe(_ recipe: Recipe) async throws
}

public protocol DeleteRecipeUseCase {
    func deleteRecipe(withId recipeId: String) async throws
}
