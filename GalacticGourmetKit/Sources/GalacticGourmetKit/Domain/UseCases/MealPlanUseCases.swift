//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol CreateMealPlanUseCase {
    func createMealPlan(for week: DateRange, with meals: [MealSlot: Recipe]) async throws
}

public protocol FetchMealPlanUseCase {
    func fetchMealPlan(for week: DateRange) async throws -> MealPlan?
}

public protocol UpdateMealPlanUseCase {
    func updateMealPlan(_ mealPlan: MealPlan) async throws
}

public protocol DeleteMealPlanUseCase {
    func deleteMealPlan(for week: DateRange) async throws
}



//public class MealPlanManager: CreateMealPlanUseCase, FetchMealPlanUseCase, UpdateMealPlanUseCase, DeleteMealPlanUseCase {
//    
//    private var mealPlans: [DateRange: MealPlan] = [:]
//    
//    public init() {}
//    
//    // MARK: - CreateMealPlanUseCase
//    
//    public func createMealPlan(for week: DateRange, with meals: [MealSlot: Recipe]) {
//        let mealPlan = MealPlan(dateRange: week, meals: meals)
//        mealPlans[week] = mealPlan
//    }
//    
//    // MARK: - FetchMealPlanUseCase
//    
//    public func fetchMealPlan(for week: DateRange) -> MealPlan? {
//        return mealPlans[week]
//    }
//    
//    // MARK: - UpdateMealPlanUseCase
//    
//    public func updateMealPlan(_ mealPlan: MealPlan) {
//        guard let week = mealPlan.dateRange else {
//            return
//        }
//        mealPlans[week] = mealPlan
//    }
//    
//    // MARK: - DeleteMealPlanUseCase
//    
//    public func deleteMealPlan(for week: DateRange) {
//        mealPlans.removeValue(forKey: week)
//    }
//}