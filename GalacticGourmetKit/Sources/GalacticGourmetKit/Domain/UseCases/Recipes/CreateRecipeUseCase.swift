//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol CreateRecipeUseCase {
    func createRecipe(_ recipe: RecipeCreationModel) async throws
}

extension UseCase<RecipeCreationModel, Void>: CreateRecipeUseCase {
    public func createRecipe(_ recipe: RecipeCreationModel) async throws {
        try await execute(recipe)
    }
}
