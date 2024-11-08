//
// Copyright © 2022 Alexander Romanov
// EventKitErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum EventKit: Sendable {
        case deleteItem
        case updateItem
        case savingItem
        case fetchItems
        case notAccess
        case unknown
    }
}

extension AppError.Enums.EventKit: AppErrorProtocol {
    public var title: String {
        switch self {
        case .deleteItem: return "Delete error"
        case .updateItem: return "Update error"
        case .savingItem: return "Saving error"
        case .fetchItems: return "Fetch error"
        case .notAccess: return "No access to the calendar"
        case .unknown: return "Unknown"
        }
    }

    public var subtitle: String? {
        switch self {
        case .notAccess: return "Please allow access to calendar in settings"
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
