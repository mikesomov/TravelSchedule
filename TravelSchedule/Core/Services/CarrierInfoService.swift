//
//  CarrierInfoService.swift
//  TravelSchedule
//
//  Created by Mike Somov on 18.09.2025.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias CarrierInfo = Components.Schemas.CarrierResponse

// MARK: - Protocols

protocol CarrierInfoServiceProtocol {
    func getCarrierInfo(code: String) async throws -> CarrierInfo
}

// MARK: - Classes

final class CarrierInfoService: CarrierInfoServiceProtocol {

    // MARK: - Private properties
    
    private let client: Client
    private let apiKey: String
    
    // MARK: - Initialisers
    
    init(client: Client, apiKey: String = APIKeys.yandex) {
        self.client = client
        self.apiKey = apiKey
    }

    // MARK: - Public methods
    
    func getCarrierInfo(code: String) async throws -> CarrierInfo {
        let response = try await client.getCarrierInfo(
            query: .init(
                apikey: apiKey,
                code: code
            )
        )
        return try response.ok.body.json
    }
}
