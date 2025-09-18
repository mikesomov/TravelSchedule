//
//  APIKeys.swift
//  TravelSchedule
//
//  Created by Mike Somov on 17.09.2025.
//

import Foundation

// MARK: - Enums

enum APIKeys {
    static let yandex: String = {
        guard
            let url = Bundle.main.url(forResource: "Keys", withExtension: "plist"),
            let data = try? Data(contentsOf: url),
            let dict = try? PropertyListSerialization.propertyList(from: data, format: nil) as? [String: Any],
            let key = dict["YANDEX_API_KEY"] as? String, !key.isEmpty
        else {
            assertionFailure("Missing or invalid YANDEX_API_KEY in Keys.plist")
            return ""
        }
        return key
    }()
}
