//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol FetchEventDetailUseCase {
    func fetchEventDetail(for eventId: String) async throws -> CookingEventDetail
}
