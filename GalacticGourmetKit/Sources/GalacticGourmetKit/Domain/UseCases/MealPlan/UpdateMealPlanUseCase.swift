//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol UpdateMealPlanUseCase {
    func updateMealPlan(_ mealPlan: MealPlan) async throws
}

extension UseCaseSender<MealPlan>: UpdateMealPlanUseCase {
    public func updateMealPlan(_ mealPlan: MealPlan) async throws {
        try await execute(mealPlan)
    }
}
