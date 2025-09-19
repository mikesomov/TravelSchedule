//
//  CopyrightService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 19.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Copyright = Components.Schemas.CopyrightResponse

// MARK: - Protocols

protocol CopyrightServiceProtocol {
    func getCopyright(format: Operations.getCopyright.Input.Query.formatPayload) async throws -> Copyright
}

// MARK: - Classes

final class CopyrightService: CopyrightServiceProtocol {
    
    // MARK: - Private properties
    
    private let client: Client
    private let apikey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apikey: String = APIKeys.yandex) {
        self.client = client
        self.apikey = apikey
    }
    
    // MARK: - Public methods
    
    func getCopyright(format: Operations.getCopyright.Input.Query.formatPayload = .json) async throws -> Copyright {
        let response = try await client.getCopyright(query: .init(
            apikey: apikey,
            format: format
        ))
        return try response.ok.body.json
    }
}
