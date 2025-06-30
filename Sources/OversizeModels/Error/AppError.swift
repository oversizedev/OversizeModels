//
// Copyright © 2022 Alexander Romanov
// AppError.swift
//

import SwiftUI

public protocol AppErrorProtocol: Sendable {
    var title: String { get }
    var subtitle: String? { get }
    var image: Image? { get }
    var icon: Image? { get }
}

public enum AppError: Error {
    case network(type: Enums.NetworkError)
    case cloudKit(type: Enums.CloudKit)
    case location(type: Enums.Location)
    case coreData(type: Enums.CoreData)
    case eventKit(type: Enums.EventKit)
    case contacts(type: Enums.Contacts)
    case notifications(type: Enums.Notification)
    case cloudDocuments(type: Enums.CloudDocuments)
    case fileManager(type: Enums.FileManager)
    case healthKit(type: Enums.HealthKit)
    case custom(title: String, subtitle: String? = nil, image: Image? = nil)
    public class Enums {}
}

extension AppError: AppErrorProtocol {
    public var title: String {
        switch self {
        case let .network(type): type.title
        case let .cloudKit(type): type.title
        case let .location(type): type.title
        case let .coreData(type): type.title
        case let .eventKit(type): type.title
        case let .contacts(type): type.title
        case let .notifications(type): type.title
        case let .cloudDocuments(type): type.title
        case let .fileManager(type): type.title
        case let .healthKit(type): type.title
        case let .custom(title, _, _): title
        }
    }

    public var subtitle: String? {
        switch self {
        case let .network(type): type.subtitle
        case let .cloudKit(type): type.subtitle
        case let .location(type): type.subtitle
        case let .coreData(type): type.subtitle
        case let .eventKit(type): type.subtitle
        case let .contacts(type): type.subtitle
        case let .notifications(type): type.subtitle
        case let .cloudDocuments(type): type.subtitle
        case let .fileManager(type): type.subtitle
        case let .healthKit(type): type.subtitle
        case let .custom(_, subtitle, _): subtitle
        }
    }

    public var image: Image? {
        switch self {
        case let .network(type): type.image
        case let .cloudKit(type): type.image
        case let .location(type): type.image
        case let .coreData(type): type.image
        case let .eventKit(type): type.image
        case let .contacts(type): type.image
        case let .notifications(type): type.image
        case let .cloudDocuments(type): type.image
        case let .fileManager(type): type.image
        case let .healthKit(type): type.image
        case let .custom(_, _, image): image
        }
    }

    public var icon: Image? {
        switch self {
        case let .network(type): type.icon
        case let .cloudKit(type): type.icon
        case let .location(type): type.icon
        case let .coreData(type): type.icon
        case let .eventKit(type): type.icon
        case let .contacts(type): type.icon
        case let .notifications(type): type.icon
        case let .cloudDocuments(type): type.icon
        case let .fileManager(type): type.icon
        case let .healthKit(type): type.icon
        case let .custom(_, _, image): image
        }
    }
}
