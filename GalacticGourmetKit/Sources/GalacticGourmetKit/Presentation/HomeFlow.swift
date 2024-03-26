//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public struct HomeFlow {
    let dependencies: Dependencies
    
    func makeRecipesList() -> RecipeListViewModel {
        RecipeListViewModel(fetchRecipesUseCase: dependencies.fetchRecipesUseCase)
    }
    
}
