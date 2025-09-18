//
//  SchedualBetweenStationsService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 17.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias SchedualSegments  = Components.Schemas.Segments

// MARK: - Protocols

protocol SchedualBetweenStationsServiceProtocol {
    func getSchedualBetweenStations(
        from: String,
        to: String,
        date: String
    ) async throws -> SchedualSegments
}

// MARK: - Classes

final class SchedualBetweenStationsService: SchedualBetweenStationsServiceProtocol {
    
    // MARK: - Private properties
    
    private let client: Client
    private let apiKey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apiKey: String = APIKeys.yandex) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // MARK: - Public methods
    
    func getSchedualBetweenStations(
        from: String,
        to: String,
        date: String
    ) async throws -> SchedualSegments {
        let response = try await client.getSchedualBetweenStations(
            query: .init(
                apikey: apiKey,
                from: from,
                to: to,
                date: date
            ))
        return try response.ok.body.json
    }
}
