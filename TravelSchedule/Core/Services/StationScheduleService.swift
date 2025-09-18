//
//  StationScheduleService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 17.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias StationScheduleResponse = Components.Schemas.ScheduleResponse

// MARK: - Protocols

protocol StationScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> StationScheduleResponse
}

// MARK: - Classes

final class StationScheduleService: StationScheduleServiceProtocol {
    
    // MARK: - Private properties
    
    private let client: Client
    private let apiKey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apiKey: String = APIKeys.yandex) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getStationSchedule(station: String) async throws -> StationScheduleResponse {
        let response = try await client.getStationSchedule(query: .init(
                apikey: apiKey,
                station: station,
                format: "json",
                transport_types: "электричка",
                direction: "На Москву",
                system: "yandex",
            ))
        return try response.ok.body.json
    }
}
