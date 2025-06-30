//
// Copyright © 2022 Alexander Romanov
// NetworkErrors.swift
//

import OversizeLocalizable
import SwiftUI

public extension AppError.Enums {
    enum NetworkError: Sendable {
        case decode
        case invalidURL
        case noResponse
        case unauthorized
        case unexpectedStatusCode
        case unknown
        case apiError(String, String?)
    }
}

extension AppError.Enums.NetworkError: AppErrorProtocol {
    public var title: String {
        switch self {
        case .decode:
            L10n.Error.somethingWentWrong
        case .unauthorized:
            L10n.Error.authorisationError
        case .invalidURL:
            L10n.Error.invalidRequest
        case .noResponse:
            L10n.Error.nothingCameFromServer
        case .unexpectedStatusCode:
            L10n.Error.somethingWentWrong
        case .unknown:
            L10n.Error.somethingWentWrong
        case let .apiError(title, _):
            title
        }
    }

    public var subtitle: String? {
        switch self {
        case .decode:
            L10n.Error.somethingStrangeCameFromServer
        case .unauthorized:
            L10n.Error.looksLikeYouNeedToLogin
        case .invalidURL:
            L10n.Error.looksLikeTheAppIsBroken
        case .noResponse:
            L10n.Error.tryAgainLater
        case .unexpectedStatusCode:
            L10n.Error.somethingStrangeCameFromServer
        case .unknown:
            L10n.Error.tryAgainLater
        case let .apiError(_, subtitle):
            subtitle
        }
    }

    public var image: Image? {
        switch self {
        default:
            Image("Error", bundle: .module)
        }
    }

    public var icon: Image? {
        nil
    }
}
