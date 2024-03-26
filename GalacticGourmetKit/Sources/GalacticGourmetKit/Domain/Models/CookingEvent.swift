//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 23.03.2024.
//

import Foundation

public struct CookingEvent: Identifiable {
    public var id: String
    public var title: String
    public var description: String
    public var date: Date
    public var location: Location
    public var participantLimit: Int?
    public var registeredParticipants: Int

    public init(id: String, title: String, description: String, date: Date, location: Location, participantLimit: Int?, registeredParticipants: Int) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.location = location
        self.participantLimit = participantLimit
        self.registeredParticipants = registeredParticipants
    }
}
