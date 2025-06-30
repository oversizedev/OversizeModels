# OversizeModels

A comprehensive Swift library providing application configuration models and a typed error handling system for iOS, macOS, tvOS, and watchOS applications.

## Overview

OversizeModels is designed to streamline the management of application configurations and provide a robust, type-safe error handling system for common iOS services. It offers a clean, structured approach to handling app metadata, settings, and comprehensive error reporting across various system services.

## Features

### 🔧 Application Configuration
- **Plist-based Configuration**: Complete app configuration management through property list files
- **App Metadata Management**: Structured handling of app information, titles, and descriptions
- **Store Integration**: Support for App Store features, reviews, and sharing
- **Developer & Company Links**: Centralized management of social media and contact information
- **URL Generation**: Automatic URL generation for App Store, social media, and support links

### 🚨 Comprehensive Error Handling
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
- Xcode 15.0+
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

### Application Configuration

Create a property list file (`Configuration.plist`) in your app bundle with your configuration data:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Apps</key>
    <array>
        <dict>
            <key>Id</key>
            <string>com.yourcompany.yourapp</string>
            <key>Name</key>
            <string>Your App Name</string>
            <key>Title</key>
            <string>Amazing App</string>
        </dict>
    </array>
    <key>Links</key>
    <dict>
        <key>App</key>
        <dict>
            <key>AppStoreID</key>
            <string>1234567890</string>
            <key>Url</key>
            <string>https://yourapp.com</string>
        </dict>
    </dict>
</dict>
</plist>
```

Load and use the configuration in your Swift code:

```swift
import OversizeModels

// Load configuration from plist
if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist"),
   let data = FileManager.default.contents(atPath: path) {
    
    do {
        let decoder = PropertyListDecoder()
        let config = try decoder.decode(PlistConfiguration.self, from: data)
        
        // Access app information
        let appName = config.apps.first?.name
        let appTitle = config.apps.first?.title
        
        // Generate URLs
        let appStoreURL = config.links.app.appStoreReview
        let websiteURL = config.links.app.url
        
        print("App: \(appName ?? "Unknown")")
        print("App Store URL: \(appStoreURL?.absoluteString ?? "N/A")")
        
    } catch {
        print("Failed to load configuration: \(error)")
    }
}
```

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

## Project Structure

```
OversizeModels/
├── Sources/
│   └── OversizeModels/
│       ├── Config/
│       │   └── AppConfig.swift          # Application configuration models
│       ├── Error/
│       │   ├── AppError.swift           # Main error protocol and enum
│       │   ├── NetworkErrors.swift      # Network-related errors
│       │   ├── CoreDataErrors.swift     # Core Data errors
│       │   ├── CloudKitErrors.swift     # CloudKit errors
│       │   ├── EventKitErrors.swift     # Calendar/EventKit errors
│       │   ├── ContactsErrors.swift     # Contacts framework errors
│       │   ├── HealthKitErrors.swift    # HealthKit errors
│       │   ├── LocationErrors.swift     # Location services errors
│       │   ├── FileManagerError.swift   # File system errors
│       │   ├── NotificationsErrors.swift # Push notification errors
│       │   └── CloudDocumentsErrors.swift # iCloud Documents errors
│       └── Resources/                   # Resource files
└── Tests/
    └── OversizeModelsTests/
        └── OversizeModelsTests.swift
```

## Dependencies

OversizeModels depends on the following packages:

- **[OversizeLocalizable](https://github.com/oversizedev/OversizeLocalizable)** (v1.5.0+): Provides localization support for error messages
- **[OversizeCore](https://github.com/oversizedev/OversizeCore)** (v1.3.0+): Core utilities and extensions

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## License

OversizeModels is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

```
MIT License

Copyright (c) 2023 Alexander Romanov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

**Made with ❤️ by [Alexander Romanov](https://github.com/oversizedev)**