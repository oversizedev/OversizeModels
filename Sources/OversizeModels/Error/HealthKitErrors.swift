//
// Copyright © 2024 Alexander Romanov
// HealthKitErrors.swift, created on 26.03.2024
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum HealthKit: Sendable {
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
        case .deleteItem: "Delete error"
        case .updateItem: "Update error"
        case .savingItem: "Saving error"
        case .fetchItems: "Fetch error"
        case .notAccess: "No access to the HealthKit"
        case .unknown: L10n.Error.somethingWentWrong
        }
    }

    public var subtitle: String? {
        switch self {
        case .notAccess: "Please allow access to HealthKit in settings"
        default: L10n.Error.tryAgainLater
        }
    }

    public var image: Image? {
        Image("Error", bundle: .module)
    }

    public var icon: Image? {
        nil
    }
}
