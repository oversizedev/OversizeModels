//
// Copyright © 2022 Alexander Romanov
// CloudKitErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum CloudKit: Sendable {
        case decode
        case noAccount
        case notAccess
        case unknown
    }
}

extension AppError.Enums.CloudKit: AppErrorProtocol {
    public var title: String {
        switch self {
        case .decode: L10n.Error.dataFromICloudCouldNotBeRead
        case .noAccount: L10n.Error.looksLikeYouDonTHaveAnICloudAccount
        case .notAccess: L10n.Error.noAccessToICloud
        case .unknown: L10n.Error.somethingWentWrongWithICloud
        }
    }

    public var subtitle: String? {
        switch self {
        case .decode: L10n.Error.updatingAppShouldHelp
        case .noAccount: L10n.Error.mostLikelyYouNeedToLogInWithYourAppleIDInYourPhoneSettings
        case .notAccess: L10n.Error.mostLikelyYouNeedToLogInWithYourAppleIDInYourPhoneSettings
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
