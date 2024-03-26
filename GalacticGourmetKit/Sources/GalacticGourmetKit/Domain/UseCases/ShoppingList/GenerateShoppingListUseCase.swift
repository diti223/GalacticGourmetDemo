//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol GenerateShoppingListUseCase {
    func generateShoppingList(from mealPlan: MealPlan) async throws -> ShoppingList
}
