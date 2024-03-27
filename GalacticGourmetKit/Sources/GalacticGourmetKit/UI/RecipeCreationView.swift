//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 26.03.2024.
//

import Foundation
import SwiftUI

struct RecipeCreationView: View {
    @ObservedObject var viewModel: RecipeCreationViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Recipe Details")) {
                    TextField("Title", text: $viewModel.title)
                    TextField("Description", text: $viewModel.description)
                    Picker("Category", selection: $viewModel.category) {
                        ForEach(RecipeCategory.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category as RecipeCategory?)
                        }
                    }
                }
                
                Section(header: Text("Ingredients")) {
                    ForEach($viewModel.ingredients.indices, id: \.self) { index in
                        TextField("Ingredient", text: $viewModel.ingredients[index].name)
                        // Assuming Ingredient has a name property for simplification
                    }
                    Button(action: {
                        viewModel.ingredients.append(Ingredient(name: "", quantity: ""))
                    }) {
                        Label("Add Ingredient", systemImage: "plus")
                    }
                }
                
                Section(header: Text("Steps")) {
                    ForEach($viewModel.steps.indices, id: \.self) { index in
                        TextField("Step \(index + 1)", text: $viewModel.steps[index])
                    }
                    Button(action: {
                        viewModel.steps.append("")
                    }) {
                        Label("Add Step", systemImage: "plus")
                    }
                }
                
                Section {
                    Button("Create Recipe") {
                        Task {
                            do {
                                try await viewModel.createRecipe()
                                // Handle success, e.g., show success message or navigate away
                            } catch {
                                // Handle error, e.g., show error message
                            }
                        }
                    }
                }
            }
            .navigationTitle("New Recipe")
        }
    }
}
