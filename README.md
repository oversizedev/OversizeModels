# OversizeModels

A comprehensive Swift library providing application configuration models and a typed error handling system for iOS, macOS, tvOS, and watchOS applications.

## Features

### Comprehensive Error Handling
- **Type-Safe Errors**: Structured error types for consistent error handling
- **Service-Specific Errors**: Dedicated error types for various iOS services:
  - Network operations
  - CloudKit integration
  - Core Data operations
  - EventKit calendar access
  - Contacts framework
  - Push notifications
  - CloudDocuments
  - FileManager operations
  - HealthKit integration
  - Location services

- **Localized Error Messages**: Built-in localization support for user-friendly error messages
- **Rich Error Context**: Each error includes title, subtitle, and optional imagery
- **SwiftUI Integration**: Ready-to-use error components for SwiftUI applications

### 🌐 Platform Support
- iOS 15+
- macOS 12+
- tvOS 15+
- watchOS 9+

## Requirements

- Swift 6.0+
- Xcode 16.4+
- iOS 15.0+ / macOS 12.0+ / tvOS 15.0+ / watchOS 9.0+

## Installation

### Swift Package Manager

Add OversizeModels to your project using Swift Package Manager. In Xcode:

1. Go to **File** → **Add Package Dependencies**
2. Enter the repository URL:
   ```
   https://github.com/oversizedev/OversizeModels.git
   ```
3. Select the version you want to use
4. Add the package to your target

Or add it to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/oversizedev/OversizeModels.git", from: "1.0.0")
]
```

Then add it to your target:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "OversizeModels", package: "OversizeModels")
    ]
)
```

## Usage

### Error Handling

Use the comprehensive error system for consistent error handling across your app:

```swift
import OversizeModels

// Network error handling
func handleNetworkOperation() {
    do {
        // Your network operation here
        try performNetworkRequest()
    } catch {
        let appError = AppError.network(type: .noResponse)
        
        // Display user-friendly error
        print("Error: \(appError.title)")
        print("Description: \(appError.subtitle ?? "")")
        
        // Use in SwiftUI
        // Image(appError.image)
    }
}

// Core Data error handling
func handleCoreDataOperation() {
    do {
        // Your Core Data operation
        try saveCoreDataContext()
    } catch {
        let appError = AppError.coreData(type: .savingItem)
        showErrorAlert(appError)
    }
}

// Custom error handling
func handleCustomError() {
    let customError = AppError.custom(
        title: "Operation Failed",
        subtitle: "Please try again later",
        image: nil
    )
    
    displayError(customError)
}

// Error display function
func displayError(_ error: AppErrorProtocol) {
    print("Title: \(error.title)")
    if let subtitle = error.subtitle {
        print("Subtitle: \(subtitle)")
    }
    
    // In SwiftUI, you can use error.image for visual representation
}
```

### Service-Specific Error Handling

Handle specific service errors with detailed context:

```swift
import OversizeModels

// HealthKit operations
func requestHealthKitPermission() {
    // Your HealthKit code here
    // On error:
    let healthError = AppError.healthKit(type: .notAccess)
    // Shows: "No access to the HealthKit" with subtitle "Please allow access to HealthKit in settings"
}

// Location services
func requestLocationPermission() {
    // Your location code here
    // On error:
    let locationError = AppError.location(type: .notAccess)
    // Provides localized error messages
}

// CloudKit operations
func syncWithCloudKit() {
    // Your CloudKit code here
    // On error:
    let cloudError = AppError.cloudKit(type: .networkError)
    // Provides appropriate error context
}
```

## License

OversizeModels is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

---

<div align="center">

**Made with ❤️ by the Oversize**

</div>
