//
// Copyright © 2022 Alexander Romanov
// ContactsErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum Contacts: Sendable {
        case notAccess
        case unknown
    }
}

extension AppError.Enums.Contacts: AppErrorProtocol {
    public var title: String {
        switch self {
        case .notAccess: "No access to the contacts"
        case .unknown: L10n.Error.somethingWentWrong
        }
    }

    public var subtitle: String? {
        switch self {
        case .notAccess: "Please allow access to contacts in settings"
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
