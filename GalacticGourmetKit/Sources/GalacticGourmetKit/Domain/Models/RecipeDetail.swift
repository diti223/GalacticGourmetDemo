//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct RecipeDetail: Identifiable {
    public var id: String
    public var title: String
    public var description: String
    public var ingredients: [Ingredient]
    public var steps: [String]
    public var cookingTime: Int // in minutes
    public var category: RecipeCategory
    public var dietaryRestrictions: [DietaryRestriction]
    public var images: [String] // URLs or asset names
    public var nutritionFacts: NutritionFacts
    public var userRatings: [UserRating]
    public var comments: [Comment]
    
    public init(id: String, title: String, description: String, ingredients: [Ingredient], steps: [String], cookingTime: Int, category: RecipeCategory, dietaryRestrictions: [DietaryRestriction], images: [String], nutritionFacts: NutritionFacts, userRatings: [UserRating], comments: [Comment]) {
        self.id = id
        self.title = title
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.cookingTime = cookingTime
        self.category = category
        self.dietaryRestrictions = dietaryRestrictions
        self.images = images
        self.nutritionFacts = nutritionFacts
        self.userRatings = userRatings
        self.comments = comments
    }
}

public typealias Gram = Int
public struct NutritionFacts {
    public var calories: Int
    public var protein: Gram // in grams
    public var carbs: Gram // in grams
    public var fat: Gram // in grams
    // Add more as needed
    public init(calories: Int, protein: Gram, carbs: Gram, fat: Gram) {
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
        self.fat = fat
    }
}

public struct UserRating {
    public var userId: String
    public var rating: Int // e.g., 1-5 scale
    public init(userId: String, rating: Int) {
        self.userId = userId
        self.rating = rating
    }
}

public struct Comment {
    public var userId: String
    public var text: String
    public var datePosted: Date
    public init(userId: String, text: String, datePosted: Date) {
        self.userId = userId
        self.text = text
        self.datePosted = datePosted
    }
}
