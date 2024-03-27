//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 26.03.2024.
//

import Foundation

public enum DietaryRestriction: String, CaseIterable, Codable {
    case vegetarian
    case vegan
    case glutenFree
    case dairyFree
    case nutFree
}

