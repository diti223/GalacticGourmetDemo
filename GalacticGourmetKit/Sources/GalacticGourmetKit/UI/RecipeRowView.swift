//
//  SwiftUIView.swift
//  
//
//  Created by Adrian Bilescu on 25.03.2024.
//

import SwiftUI

struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            if let imageName = recipe.images.first {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            } else {
                Image(systemName: "photo")
                    .frame(width: 60, height: 60)
            }
            
            VStack(alignment: .leading) {
                Text(recipe.title)
                    .font(.headline)
                Text(recipe.category.rawValue.capitalized)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}



#Preview {
    RecipeRowView(
        recipe: Recipe(
            id: "",
            title: "",
            description: "",
            ingredients: [],
            steps: [],
            cookingTime: 10,
            category: .breakfast,
            dietaryRestrictions: [],
            images: []
        )
    )
}
