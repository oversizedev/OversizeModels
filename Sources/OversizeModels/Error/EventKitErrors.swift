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
        case .deleteItem: "Delete error"
        case .updateItem: "Update error"
        case .savingItem: "Saving error"
        case .fetchItems: "Fetch error"
        case .notAccess: "No access to the calendar"
        case .unknown: L10n.Error.somethingWentWrong
        }
    }

    public var subtitle: String? {
        switch self {
        case .notAccess: "Please allow access to calendar in settings"
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
