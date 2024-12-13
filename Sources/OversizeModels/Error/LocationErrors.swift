//
// Copyright © 2022 Alexander Romanov
// LocationErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum Location: Sendable {
        case notDetermined
        case notAccess
        case unknown
    }
}

extension AppError.Enums.Location: AppErrorProtocol {
    public var title: String {
        switch self {
        case .notDetermined: L10n.Error.selectLocationSettings
        case .notAccess: L10n.Error.noAccessToLocation
        case .unknown: L10n.Error.noAccessToLocation
        }
    }

    public var subtitle: String? {
        switch self {
        case .notDetermined: L10n.Error.withoutAccessToLocationApplicationCannotWork
        case .notAccess: L10n.Error.pleaseAllowAccessToLocationInSettings
        case .unknown: L10n.Error.somethingIsWrongWithTheLocation
        }
    }

    public var image: Image? {
        switch self {
        default: Image("Error", bundle: .module)
        }
    }

    public var icon: Image? {
        nil
    }
}
