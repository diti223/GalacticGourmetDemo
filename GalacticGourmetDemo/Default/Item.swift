//
//  Item.swift
//  GalacticGourmetDemo
//
//  Created by Adrian Bilescu on 22.03.2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
