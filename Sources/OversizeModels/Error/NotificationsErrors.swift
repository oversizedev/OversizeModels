//
// Copyright © 2023 Alexander Romanov
// NotificationsErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum Notification: Sendable {
        case notDetermined
        case notAccess
        case unknown
    }
}

extension AppError.Enums.Notification: AppErrorProtocol {
    public var title: String {
        switch self {
        case .notDetermined: "Select notifications settings"
        case .notAccess: "No access to notifications"
        case .unknown: "Unknown"
        }
    }

    public var subtitle: String? {
        switch self {
        case .notDetermined: nil
        case .notAccess: "Please allow access to notifications in settings"
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
