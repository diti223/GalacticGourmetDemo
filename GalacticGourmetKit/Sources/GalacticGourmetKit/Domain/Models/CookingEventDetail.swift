import Foundation

public struct CookingEventDetail: Identifiable {
    public var id: String
    public var title: String
    public var description: String
    public var date: Date
    public var location: String // Could be an online link or physical address
    public var participantLimit: Int?
    public var registeredParticipants: Int
    public var preparationChecklist: [String]

    public init(id: String, title: String, description: String, date: Date, location: String, participantLimit: Int?, registeredParticipants: Int, preparationChecklist: [String]) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.location = location
        self.participantLimit = participantLimit
        self.registeredParticipants = registeredParticipants
        self.preparationChecklist = preparationChecklist
    }
}