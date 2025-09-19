//
//  RouteStationsService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 17.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias RouteStations = Components.Schemas.Thread

// MARK: - Protocols

protocol RouteStationsServiceProtocol {
    func getRouteStations(
        uid: String,
        format: String
    ) async throws -> RouteStations
}

// MARK: - Classes

final class RouteStationsService: RouteStationsServiceProtocol {
    
    // MARK: - Private properties
    
    private let client: Client
    private let apiKey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apiKey: String = APIKeys.yandex) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // MARK: - Public methods
    
    func getRouteStations(uid: String, format: String) async throws -> RouteStations {
        let response = try await client.getThread(
            query: .init(
                apikey: apiKey,
                uid: uid,
                format: format
            ))
        return try response.ok.body.json
    }
}
