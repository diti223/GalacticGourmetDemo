//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct Ingredient: Codable {
    public var name: String
    public var quantity: String // could be "1 cup", "2 tablespoons", etc.

    public init(name: String, quantity: String) {
        self.name = name
        self.quantity = quantity
    }
}
