# Flutter Test Sample

A complete Flutter application demonstrating how to write and execute both **Widget Tests** and **Integration Tests**.

## Overview

This project serves as a practical testing sample containing:
- A basic application flow with **Login**, **Home (Counter)**, and **List Items** views.
- **Widget Tests**: Individual component testing ensuring UI isolation and state verification without physical devices.
- **Integration Tests**: End-to-end testing running on a real device/emulator to verify the complete user flow sequence (Login -> Home Counter -> Scrolling List).

## Features Tested

1. **Authentication (Login Test)**
   - Text input validations and interactions
   - Login controller logic expectations
   - View transitions

2. **Counter View (Home Test)**
   - Floating action button interaction
   - Finding elements by `ValueKey`
   - State updates verification

3. **Scrollable List (List Items Test)**
   - Rendering long `ListView`s
   - Scrolling until an item becomes visible
   - Delay and async operations handling

## Getting Started

To run the widget tests:
```bash
flutter test
```

To run the integration tests (requires a running device or emulator):
```bash
flutter test integration_test/app_integration_test.dart
```

## Maestro UI Testing

We have also included [Maestro](https://maestro.mobile.dev/) for simple, declarative UI testing. 
Maestro interacts with your Flutter app just like a real user would.

### Running Maestro Tests

1. Install Maestro (macOS/Linux or Windows WSL):
```bash
curl -Ls "https://get.maestro.mobile.dev" | bash
```
> For Windows, you can use WSL, or follow the [official Windows guide](https://maestro.mobile.dev/getting-started/installing-maestro).

2. Make sure your application is compiled and running on an emulator or physical device:
```bash
flutter run
```

3. Run the Maestro flow in a separate terminal:
```bash
maestro test .maestro/loginFlow.yaml
```

To visually build and record Maestro tests, you can also use Maestro Studio:
```bash
maestro studio
```

## Resources

The following links provide useful information from Flutter documentation, to show how you can start your first Widget and Integration tests.

- [Integration Test Cookbook](https://docs.flutter.dev/cookbook/testing/integration/introduction)
- [Widget Test Cookbook](https://docs.flutter.dev/cookbook/testing/widget/introduction)
- [Flutter Online Documentation](https://docs.flutter.dev/)
- [Maestro Documentation](https://maestro.mobile.dev/)
