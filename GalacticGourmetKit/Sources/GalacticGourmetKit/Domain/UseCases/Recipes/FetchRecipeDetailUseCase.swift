//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol FetchRecipeDetailUseCase {
    func fetchRecipeDetail(for recipeId: String) async throws -> RecipeDetail?
}
