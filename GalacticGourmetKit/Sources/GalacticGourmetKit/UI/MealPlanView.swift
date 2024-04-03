//
//  SwiftUIView.swift
//  
//
//  Created by Adrian Bilescu on 26.03.2024.
//

import SwiftUI

struct MealPlanView: View {
    @StateObject var viewModel: MealPlanViewModel
    
    var body: some View {
        NavigationView {
            List {
                if let mealPlan = viewModel.mealPlan {
                    ForEach(MealSlot.allCases, id: \.self) { slot in
                        Section(slot.rawValue.capitalized) {
                            if let recipes = mealPlan.meals[slot] {
                                ForEach(recipes, id: \.id) { recipe in
                                    Text(recipe.title)
                                        .contentShape(Rectangle())
                                        .onTapGesture {
                                            // Handle meal slot tap, possibly to change the recipe or view details
                                        }
                                }
                            } else {
                                Text("Not set")
                            }
                        }
                        
                    }
                } else {
                    Text("No meal plan set for this week. Tap to create one.")
                        .onTapGesture {
                            // Handle tap to create a new meal plan
                        }
                }
                
                Section(header: Text("Shopping List")) {
                    if viewModel.shoppingList.items.isEmpty {
                        Text("Your shopping list is empty.")
                    } else {
                        ForEach(viewModel.shoppingList.items) { item in
                            ShoppingListItemView(item: item)
                                .onTapGesture {
                                    // Handle mark item as purchased/not purchased
                                }
                        }
                    }
                }
            }
            .navigationTitle("Meal Plan")
            .toolbar {
                ToolbarItemGroup(placement: .automatic) {
                    Button(action: {
                        // Handle adding a new meal or editing the meal plan
                        Task {
                            await viewModel.createMealPlan(
                                with: [
                                    .breakfast: [Recipe(
                                        id: "",
                                        title: "",
                                        description: "",
                                        ingredients: [],
                                        steps: [],
                                        cookingTime: 60,
                                        category: .breakfast,
                                        dietaryRestrictions: [.dairyFree, .glutenFree],
                                        images: []
                                    )]
                                ]
                            )
                        }
                    }) {
                        Image(systemName: "plus")
                    }
                    Button(action: {
                        Task {
                            await viewModel.deleteMealPlan()
                        }
                    }) {
                        Image(systemName: "trash")
                    }
                }
            }
            .task {
                await viewModel.loadMealPlan()
            }
        }
    }
}

struct ShoppingListItemView: View {
    var item: ShoppingItem
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text(item.quantity)
            Image(systemName: item.isPurchased ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isPurchased ? .green : .gray)
        }
    }
}
