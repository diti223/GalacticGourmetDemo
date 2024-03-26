//
//  GalacticGourmetDemoApp.swift
//  GalacticGourmetDemo
//
//  Created by Adrian Bilescu on 22.03.2024.
//

import SwiftUI
import SwiftData
import GalacticGourmetKit

@main
struct GalacticGourmetDemoApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            HomeView(fetchRecipesUseCase: RecipeLoader())
        }
    }
}





extension JSONDecoder {
    static var recipeDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
