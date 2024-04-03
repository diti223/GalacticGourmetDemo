//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol CreateMealPlanUseCase {
    func createMealPlan(_ plan: MealPlan) async throws
}

extension UseCaseSender<MealPlan>: CreateMealPlanUseCase {
    public func createMealPlan(_ plan: MealPlan) async throws {
        try await execute(plan)
    }
}
