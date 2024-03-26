//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol UpdateUserPreferencesUseCase {
    func updateUserPreferences(_ preferences: UserPreferences) async throws
}
