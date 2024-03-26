//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct RecipeFilter {
    public var categories: [RecipeCategory]?
    public var cookingTimeRange: CookingTimeRange?
    public var dietaryRestrictions: [DietaryRestriction]?
    public var ingredients: [String]? // Include or exclude recipes based on these ingredients
    public var keyword: String? // For name or description search
    
    public struct CookingTimeRange {
        public var min: Int // Minimum cooking time in minutes
        public var max: Int // Maximum cooking time in minutes

        public init(min: Int, max: Int) {
            self.min = min
            self.max = max
        }
    }

    public init(categories: [RecipeCategory]?, cookingTimeRange: CookingTimeRange?, dietaryRestrictions: [DietaryRestriction]?, ingredients: [String]?, keyword: String?) {
        self.categories = categories
        self.cookingTimeRange = cookingTimeRange
        self.dietaryRestrictions = dietaryRestrictions
        self.ingredients = ingredients
        self.keyword = keyword
    }
}


