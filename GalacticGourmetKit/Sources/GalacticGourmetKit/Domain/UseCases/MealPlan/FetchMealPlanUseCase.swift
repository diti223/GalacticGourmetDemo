//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 03.04.2024.
//

import Foundation

public protocol FetchMealPlanUseCase {
    func fetchMealPlan(for week: DateRange) async throws -> MealPlan?
}

extension UseCase<DateRange, MealPlan?>: FetchMealPlanUseCase {
    public func fetchMealPlan(for week: DateRange) async throws -> MealPlan? {
        try await execute(week)
    }
}
