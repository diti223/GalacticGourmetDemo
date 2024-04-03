//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol FetchRecommendationsUseCase {
    func fetchRecommendations(basedOn userPreferences: UserPreferences) async throws -> [Recipe]
}
