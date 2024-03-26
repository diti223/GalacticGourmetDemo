//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public protocol CheckInToEventUseCase {
    func checkInToEvent(_ event: CookingEvent) async throws
}
