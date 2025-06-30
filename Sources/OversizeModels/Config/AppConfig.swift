//
// Copyright © 2022 Alexander Romanov
// AppConfig.swift
//

import Foundation

public struct PlistConfiguration: Codable, Sendable {
    public var store: Store
    public var apps: [App]
    public var links: Links

    private enum CodingKeys: String, CodingKey, Sendable {
        case store = "Store"
        case apps = "Apps"
        case links = "Links"
    }

    public struct Links: Codable, Sendable {
        public var app: App
        public var developer: Developer
        public var company: Company

        private enum CodingKeys: String, CodingKey, Sendable {
            case app = "App"
            case developer = "Developer"
            case company = "Company"
        }

        public struct App: Codable, Hashable, Sendable {
            public var urlString: String?
            public var telegramChat: String?
            public var appStoreId: String

            public var url: URL? {
                URL(string: urlString ?? "")
            }

            public var telegramChatUrl: URL? {
                URL(string: "https://t.me/\(telegramChat ?? "")")
            }

            public var privacyPolicyURL: URL? {
                URL(string: "\(urlString ?? "")/privacy-policy")
            }

            public var termsOfUseURL: URL? {
                URL(string: "\(urlString ?? "")/terms-and-conditions")
            }

            public var iconName: String? {
                guard let icons = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
                      let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
                      let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
                      let iconFileName = iconFiles.last
                else { return nil }
                return iconFileName
            }

            public var appStoreReview: URL? {
                let url = URL(string: "itms-apps:itunes.apple.com/us/app/apple-store/id\(appStoreId)?mt=8&action=write-review")
                return url
            }

            public var appInstallShare: URL? {
                let url = URL(string: "https://itunes.apple.com/us/app/apple-store/id\(appStoreId)")
                return url
            }

            private enum CodingKeys: String, CodingKey, Sendable {
                case urlString = "Url"
                case telegramChat = "TelegramChat"
                case appStoreId = "AppStoreID"
            }
        }

        public struct Developer: Codable, Hashable, Sendable {
            public var name: String?
            public var url: String?
            public var email: String?
            public var facebook: String?
            public var telegram: String?

            private enum CodingKeys: String, CodingKey, Sendable {
                case name = "Name"
                case url = "Url"
                case email = "Email"
                case facebook = "Facebook"
                case telegram = "Telegram"
            }
        }

        public struct Company: Codable, Hashable, Sendable {
            public var name: String?
            public var urlString: String?
            public var email: String?
            public var appStoreId: String
            public var facebook: String?
            public var telegram: String?
            public var dribbble: String?
            public var instagram: String?
            public var twitter: String?
            public var cdnString: String?

            public var facebookUrl: URL? {
                URL(string: "https://www.facebook.com/\(String(describing: facebook))")
            }

            public var url: URL? {
                URL(string: urlString ?? "")
            }

            public var cdnUrl: URL? {
                URL(string: cdnString ?? "")
            }

            public var emailUrl: URL? {
                let mail = URL(string: "mailto:\(email ?? "")")
                return mail
            }

            private enum CodingKeys: String, CodingKey {
                case name = "Name"
                case urlString = "Url"
                case email = "Email"
                case appStoreId = "AppStoreID"
                case facebook = "Facebook"
                case telegram = "Telegram"
                case dribbble = "Dribbble"
                case instagram = "Instagram"
                case twitter = "Twitter"
                case cdnString = "CDNUrl"
            }
        }
    }

    public struct App: Codable, Identifiable, Hashable, Sendable {
        public var id: String
        public var name: String?
        public var title: String?
        public var subtitle: String?
        public var path: String?
        private enum CodingKeys: String, CodingKey {
            case id = "Id"
            case name = "Name"
            case title = "Title"
            case subtitle = "Subtitle"
            case path = "Path"
        }
    }

    public struct Store: Codable, Sendable {
        public var features: [StoreFeature]

        private enum CodingKeys: String, CodingKey, Sendable {
            case features = "Features"
        }

        public struct StoreFeature: Codable, Identifiable, Hashable, Equatable, Sendable {
            public var id: String {
                (image ?? "") + (title ?? "") + (subtitle ?? "")
            }

            public let image: String?
            public let title: String?
            public let subtitle: String?
            public let illustrationURL: String?
            public let screenURL: String?
            public let topScreenAlignment: Bool?
            public let backgroundColor: String?
            private enum CodingKeys: String, CodingKey {
                case image, title, subtitle, screenURL, topScreenAlignment, illustrationURL, backgroundColor
            }
        }
    }
}
