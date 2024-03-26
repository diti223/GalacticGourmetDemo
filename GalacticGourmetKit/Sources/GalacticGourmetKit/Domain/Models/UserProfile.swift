//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct UserProfile {
    public var userId: String
    public var username: String
    public var email: String
    public var avatarUrl: String? // URL or asset name
    
    public init(userId: String, username: String, email: String, avatarUrl: String?) {
        self.userId = userId
        self.username = username
        self.email = email
        self.avatarUrl = avatarUrl
    }
}

public struct UserPreferences {
    public var dietaryRestrictions: [DietaryRestriction]
    public var favoriteCuisines: [Cuisine]
    public var dislikedIngredients: [String]
    
    public init(dietaryRestrictions: [DietaryRestriction], favoriteCuisines: [Cuisine], dislikedIngredients: [String]) {
        self.dietaryRestrictions = dietaryRestrictions
        self.favoriteCuisines = favoriteCuisines
        self.dislikedIngredients = dislikedIngredients
    }
}

public enum Cuisine: String, CaseIterable {
    case american
    case italian
    case mexican
    case chinese
    case indian
    // Add as many as needed
}

