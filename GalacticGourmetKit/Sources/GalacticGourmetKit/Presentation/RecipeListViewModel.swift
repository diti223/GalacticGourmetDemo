//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation
import Combine

class RecipeListViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    private let fetchRecipesUseCase: FetchRecipesUseCase
    
    init(fetchRecipesUseCase: FetchRecipesUseCase) {
        self.fetchRecipesUseCase = fetchRecipesUseCase
    }
    
    @MainActor
    func fetchRecipes() async {
        isLoading = true
        do {
            self.recipes = try await fetchRecipesUseCase.fetchRecipes()
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
