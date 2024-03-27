//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 26.03.2024.
//

import Foundation
import Combine

class RecipeCreationViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var ingredients: [Ingredient] = []
    @Published var steps: [String] = []
    @Published var cookingTime: Int? = nil
    @Published var category: RecipeCategory? = nil
    @Published var dietaryRestrictions: [DietaryRestriction]? = nil
    @Published var images: [String] = []
    
    private var createRecipeUseCase: CreateRecipeUseCase
    
    init(createRecipeUseCase: CreateRecipeUseCase) {
        self.createRecipeUseCase = createRecipeUseCase
    }
    
    func createRecipe() async throws {
        let recipeCreationModel = RecipeCreationModel(
            title: title,
            description: description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : description,
            ingredients: ingredients,
            steps: steps,
            cookingTime: cookingTime,
            category: category,
            dietaryRestrictions: dietaryRestrictions,
            images: images
        )
        try await createRecipeUseCase.createRecipe(recipeCreationModel)
    }
}
