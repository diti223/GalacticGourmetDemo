//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation

public enum Location {
    case online(link: URL)
    case inPerson(address: Address)
}

public struct Address {
    public let street: String
}
