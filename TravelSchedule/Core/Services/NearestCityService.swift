//
//  NearestCityService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 17.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias NearestCity = Components.Schemas.NearestCityResponse

// MARK: - Protocols

protocol NearestCityServiceProtocol {
    func getNearestCity(
        lat: Double,
        lng: Double,
    ) async throws -> NearestCity
}

// MARK: - Classes

final class NearestCityService: NearestCityServiceProtocol {

    // MARK: - Private properties
    
    private let client: Client
    private let apiKey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apiKey: String = APIKeys.yandex) {
        self.client = client
        self.apiKey = apiKey
    }
    
    // MARK: - Public methods
    
    func getNearestCity(lat: Double, lng: Double) async throws -> NearestCity {
        let response = try await client.getNearestCity(query: .init(
                apikey: apiKey,
                lat: lat,
                lng: lng
            ))
        return try response.ok.body.json
    }
}
