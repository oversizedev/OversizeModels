//
// Copyright © 2022 Alexander Romanov
// CoreDataErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum CoreData: Sendable {
        case deleteItem
        case updateItem
        case savingItem
        case fetchItems
        case unknown
    }
}

extension AppError.Enums.CoreData: AppErrorProtocol {
    public var title: String {
        switch self {
        case .deleteItem: "Delete error"
        case .updateItem: "Update error"
        case .savingItem: "Saving error"
        case .fetchItems: "Fetch error"
        case .unknown: L10n.Error.somethingWentWrong
        }
    }

    public var subtitle: String? {
        switch self {
        case .deleteItem: L10n.Error.tryAgainLater
        case .updateItem: L10n.Error.tryAgainLater
        case .savingItem: L10n.Error.tryAgainLater
        case .fetchItems: L10n.Error.tryAgainLater
        case .unknown: L10n.Error.tryAgainLater
        }
    }

    public var image: Image? {
        Image("Error", bundle: .module)
    }

    public var icon: Image? {
        nil
    }
}
