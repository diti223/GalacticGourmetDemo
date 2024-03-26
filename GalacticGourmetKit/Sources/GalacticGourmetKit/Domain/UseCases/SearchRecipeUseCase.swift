//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol SearchRecipeUseCase {
    func searchRecipes(with query: String, filters: [RecipeFilter]) async throws -> [Recipe]
}
