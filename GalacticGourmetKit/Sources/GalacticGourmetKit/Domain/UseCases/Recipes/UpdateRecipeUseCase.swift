//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol UpdateRecipeUseCase {
    func updateRecipe(_ recipe: Recipe) async throws
}
