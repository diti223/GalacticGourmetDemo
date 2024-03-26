# GalacticGourmetDemo

GalacticGourmet is an iOS application that allows users to browse, manage recipes, and create meal plans. It's built with SwiftUI and adheres to the principles of Clean Architecture.

## Features

- View and manage a wide range of recipes including ingredients, steps, and cooking times.
- Create and organize meal plans for different date ranges.
- Check in to events, register for events, and view event details.
- Personalize the app experience with user preferences and profile settings.

## Architecture

### Domain Layer

Contains business logic, domain models, and use cases such as:
- `FetchRecipesUseCase` 
- `FetchRecipeDetailUseCase`
- And more related to meal planning, recipe management, and user profiles.

### Presentation Layer

Manages the UI and user interactions using SwiftUI and Combine for reactive programming. Each use case is paired with a view model to facilitate a clear separation of concerns.

### Infrastructure Layer

Currently, data is managed locally via a JSON file loaded from the app bundle. Network capabilities are planned for future updates.

## Running GalacticGourmet

To run the app, clone the repository, open the project in Xcode, and run it on your preferred device or simulator.

## Experiment and Contact

You're encouraged to experiment with implementing the described use cases as a learning exercise. For questions or further discussions, reach out via [LinkedIn](http://linkedin.com/in/abilescu/).
