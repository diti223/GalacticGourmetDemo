//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public typealias Minute = Int
public struct Recipe: Identifiable, Codable {
    public var id: String
    public var title: String
    public var description: String
    public var ingredients: [Ingredient]
    public var steps: [String]
    public var cookingTime: Minute // in minutes
    public var category: RecipeCategory
    public var dietaryRestrictions: [DietaryRestriction]
    public var images: [String] // URLs or asset names

    public init(
        id: String,
        title: String,
        description: String,
        ingredients: [Ingredient],
        steps: [String],
        cookingTime: Minute,
        category: RecipeCategory,
        dietaryRestrictions: [DietaryRestriction],
        images: [String]
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.ingredients = ingredients
        self.steps = steps
        self.cookingTime = cookingTime
        self.category = category
        self.dietaryRestrictions = dietaryRestrictions
        self.images = images
    }
}

