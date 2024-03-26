//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol CheckOffItemUseCase {
    func checkOffItem(on shoppingList: ShoppingList, itemId: String) async throws
}
