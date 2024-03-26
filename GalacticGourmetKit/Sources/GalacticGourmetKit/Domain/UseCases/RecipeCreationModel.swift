//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct RecipeCreationModel {
    public var title: String
    public var description: String?
    public var ingredients: [Ingredient]
    public var steps: [String]
    public var cookingTime: Int? // in minutes
    public var category: RecipeCategory?
    public var dietaryRestrictions: [DietaryRestriction]?
    public var images: [String] // local asset or remote url

    public init(title: String, description: String?, ingredients: [Ingredient], steps: [String], cookingTime: Int?, category: RecipeCategory?, dietaryRestrictions: [DietaryRestriction]?, images: [String]) {
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
