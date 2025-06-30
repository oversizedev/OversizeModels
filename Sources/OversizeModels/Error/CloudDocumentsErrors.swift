//
// Copyright © 2023 Alexander Romanov
// CloudDocumentsErrors.swift, created on 02.05.2023
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum CloudDocuments: Sendable {
        case deleteItem
        case updateItem
        case savingItem
        case fetchItems
        case notAccess
        case unknown
    }
}

extension AppError.Enums.CloudDocuments: AppErrorProtocol {
    public var title: String {
        switch self {
        case .deleteItem: "Delete error"
        case .updateItem: "Update error"
        case .savingItem: "Saving error"
        case .fetchItems: "Fetch error"
        case .notAccess: "No access to iCloud"
        case .unknown: "Unknown"
        }
    }

    public var subtitle: String? {
        switch self {
        case .notAccess: L10n.Error.mostLikelyYouNeedToLogInWithYourAppleIDInYourPhoneSettings
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
