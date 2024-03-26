//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol UpdateUserProfileUseCase {
    func updateUserProfile(_ profile: UserProfile) async throws
}
