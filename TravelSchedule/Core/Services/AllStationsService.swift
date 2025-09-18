//
//  AllStationsService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 18.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias AllStations = Components.Schemas.AllStationsResponse

// MARK: - Protocols

protocol AllStationsServiceProtocol {
    func getAllStations() async throws -> AllStations
}

// MARK: - Classes

final class AllStationsService: AllStationsServiceProtocol {
    
    // MARK: - Private properties
    
    private let client: Client
    private let apiKey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apiKey: String = APIKeys.yandex) {
        self.client = client
        self.apiKey = apiKey
    }
    
    func getAllStations() async throws -> AllStations {
        let response = try await client.getAllStations(
            query: .init(
                apikey: apiKey
            )
        )
        
        
        let responseData = try response.ok.body.html
        
        let limit = 50 * 1024 * 1024
        
        var fullData = try await Data(collecting: responseData, upTo: limit)
        
        let allStations = try JSONDecoder().decode(AllStations.self, from: fullData)
        return allStations
        
    }
}
