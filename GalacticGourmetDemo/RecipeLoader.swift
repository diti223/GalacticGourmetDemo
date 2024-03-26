//
//  RecipeLoader.swift
//  GalacticGourmetDemo
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation
import GalacticGourmetKit

struct RecipeLoader {
    func loadRecipes() -> [Recipe] {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json") else {
            fatalError("Failed to locate recipes.json in the app bundle")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let recipes = try JSONDecoder.recipeDecoder.decode([Recipe].self, from: data)
            return recipes
        } catch {
            fatalError("Failed to decode recipes.json: \(error.localizedDescription)")
        }
    }
}

extension RecipeLoader: FetchRecipesUseCase {
    func fetchRecipes() async throws -> [Recipe] {
        loadRecipes()
    }
}
