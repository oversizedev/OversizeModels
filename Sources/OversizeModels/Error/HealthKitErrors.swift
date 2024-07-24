//
// Copyright © 2024 Alexander Romanov
// HealthKitErrors.swift, created on 26.03.2024
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum HealthKit {
        case deleteItem
        case updateItem
        case savingItem
        case fetchItems
        case notAccess
        case unknown
    }
}

extension AppError.Enums.HealthKit: AppErrorProtocol {
    public var title: String {
        switch self {
        case .deleteItem: return "Delete error"
        case .updateItem: return "Update error"
        case .savingItem: return "Saving error"
        case .fetchItems: return "Fetch error"
        case .notAccess: return "No access to the HealthKit"
        case .unknown: return "Unknown"
        }
    }

    public var subtitle: String? {
        switch self {
        case .notAccess: return "Please allow access to HealthKit in settings"
        default: return L10n.Error.tryAgainLater
        }
    }

    public var image: Image? {
        Image("Error", bundle: .module)
    }

    public var icon: Image? {
        nil
    }
}
