//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct MealPlan {
    public var week: DateRange
    public var meals: [MealSlot: Recipe]
    
    public init(week: DateRange, meals: [MealSlot: Recipe]) {
        self.week = week
        self.meals = meals
    }
}

public struct DateRange {
    public var start: Date
    public var end: Date
    
    public init(start: Date, end: Date) {
        self.start = start
        self.end = end
    }
}

public enum MealSlot: String, CaseIterable {
    case breakfast
    case lunch
    case dinner
}

public struct ShoppingList {
    public var items: [ShoppingItem]
    
    public init(items: [ShoppingItem]) {
        self.items = items
    }
}

public struct ShoppingItem: Identifiable {
    public var id: String
    public var name: String
    public var quantity: String
    public var isPurchased: Bool
    
    public init(id: String, name: String, quantity: String, isPurchased: Bool) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.isPurchased = isPurchased
    }
}