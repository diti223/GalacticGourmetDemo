//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol FetchRecipesUseCase {
    func fetchRecipes() async throws -> [Recipe]
}
