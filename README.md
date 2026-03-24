# flutter_sample_app

A new Flutter project based on Clean Architecture with patterns to replicate in future projects.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Architecture

This project follows a Clean Architecture pattern to ensure separation of concerns, testability, and maintainability. Each feature is structured into layers: Presentation, Domain, Data, and API. The architecture is designed to be scalable and reusable across features.

### Feature Structure

Each feature (e.g., `auth`, `home`) is organized under `lib/features/{feature_name}/` with the following subdirectories:

- **presentation/**: Contains UI-related code.
  - `screens/`: Flutter widgets for screens.
  - `state/`: State management using Riverpod notifiers.
  - `routes/`: Routing logic for the feature.

- **domain/**: Contains business logic independent of frameworks.
  - `entity/`: Domain entities (e.g., `User`).
  - `usecase/`: Use cases that encapsulate business rules.
  - `repository/`: Abstract repository interfaces.

- **data/**: Contains data access implementations.
  - `repository/`: Concrete repository implementations.
  - `data_source/`: Data sources (e.g., remote API calls).
  - `model/`: Data models (e.g., JSON mappings).

- **api/**: Contains API-related state and configurations.
  - `state/`: Global state providers (e.g., session management).

- **di/**: Dependency injection using Riverpod providers.

### Data Flow Example (Auth Feature)

1. **Presentation Layer**: The `LoginScreen` uses a `LoginNotifier` (Riverpod) to manage UI state. User inputs trigger state changes, and actions like login call the use case.

2. **Domain Layer**: `LoginUseCase` orchestrates the login logic. It calls the `AuthRepository` interface and handles the result using a `Result` type (Success/Error).

3. **Data Layer**: `AuthRepositoryImpl` implements the repository, delegating to `AuthRemoteDataSource` for API calls via Dio. Exceptions are mapped to domain errors.

4. **API Layer**: `SessionProvider` manages authentication state globally, updating on successful login.

### Key Principles

- **Dependency Inversion**: High-level modules (Domain) don't depend on low-level modules (Data). Both depend on abstractions (interfaces).
- **Single Responsibility**: Each class has one reason to change.
- **State Management**: Riverpod for reactive state management and DI.
- **Error Handling**: Custom `Result` type for functional error handling.
- **Network**: Dio for HTTP requests, with exception mapping.

This structure ensures that features are independent, testable, and easy to extend. When adding a new feature, replicate this folder structure and adapt the layers accordingly.
