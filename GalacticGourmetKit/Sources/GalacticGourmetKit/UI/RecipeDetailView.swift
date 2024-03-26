//
//  File.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import Foundation
import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(Array(recipe.images.enumerated()), id: \.offset) { (index, element) in
                    Image(element)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 200)
                }
                
                
                Text(recipe.title)
                    .font(.title)
                
                Text(recipe.description)
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Ingredients")
                        .font(.headline)
                    
                    ForEach(recipe.ingredients, id: \.name) { ingredient in
                        Text("- \(ingredient.quantity) \(ingredient.name)")
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Steps")
                        .font(.headline)
                    
                    ForEach(recipe.steps, id: \.self) { step in
                        Text(step)
                            .padding(.bottom, 8)
                    }
                }
                
                HStack {
                    Text("Cooking Time:")
                        .font(.headline)
                    Text("\(recipe.cookingTime) minutes")
                }
                
                if !recipe.dietaryRestrictions.isEmpty {
                    Text("Dietary Restrictions:")
                        .font(.headline)
                    
                    HStack {
                        ForEach(recipe.dietaryRestrictions, id: \.self) { restriction in
                            Text(restriction.rawValue.capitalized)
                                .padding(8)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
    }
}
