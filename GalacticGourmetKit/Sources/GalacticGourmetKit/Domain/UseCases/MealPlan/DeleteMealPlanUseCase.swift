//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol DeleteMealPlanUseCase {
    func deleteMealPlan(for week: DateRange) async throws
}

extension UseCaseSender<DateRange>: DeleteMealPlanUseCase {
    public func deleteMealPlan(for week: DateRange) async throws {
        try await execute(week)
    }
}
