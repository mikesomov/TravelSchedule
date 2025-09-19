//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Mike Somov on 12.09.2025.
//

import SwiftUI
import OpenAPIURLSession

// MARK: - Structs

struct ContentView: View {
    var body: some View {
        VStack {}
        .padding()
        .onAppear {
            testFetchNearestStation()
            testFetchAllStations()
            testFetchNearestCities()
            testFetchCarrierInfo()
            testCopyrightInfo()
            testRouteStations()
            testScheduleInfo()
            testSchedualBetweenStations()
        }
    }
    
    // MARK: - Private methods
    
    private func testFetchNearestStation() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = NearestStationsService(client: client, apiKey: APIKeys.yandex)
                let stations = try await service.getNearestStations(
                    lat: 59.864177,
                    lng: 30.319163,
                    distance: 50
                )
                print("Successfully fetched stations: \(stations)")
            }
            catch {
                print("Error fetching stations: \(error)")
            }
        }
    }
    
    private func testFetchAllStations() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = AllStationsService(client: client, apiKey: APIKeys.yandex)
                let stations = try await service.getAllStations()
                print("Successfully fetched \(stations) information")
            }
            catch {
                print("Error fetching all stations: \(error.localizedDescription) information")
            }
        }
    }
    
    private func testFetchNearestCities() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = NearestCityService(client: client, apiKey: APIKeys.yandex)
                let cities = try await service.getNearestCity(lat: 54.9924, lng: 73.368)
                print("Successfully fetched \(cities)information")
            }
            catch {
                print("Error fetching nearest cities \(error.localizedDescription) information")
            }
        }
    }
    
    private func testFetchCarrierInfo() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = CarrierInfoService(client: client, apiKey: APIKeys.yandex)
                let carrier = try await service.getCarrierInfo(code: "500")
                print("Successfully fetched \(carrier) carrier information")
            }
            catch {
                print("Error fetching carrier information \(error.localizedDescription)")
            }
        }
    }
    
    private func testCopyrightInfo() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = CopyrightService(client: client, apikey: APIKeys.yandex)
                let copyright = try await service.getCopyright()
                print("Successfully fetched \(copyright) copyright information")
            }
            catch {
                print("Error fetching copyright information: \(error.localizedDescription)")
            }
        }
    }
    
    private func testRouteStations() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = RouteStationsService(client: client, apiKey: APIKeys.yandex)
                let routeStations = try await service.getRouteStations(
                    uid: "s9600216",
                    format: "json"
                )
                print("Successfully fetched \(routeStations) routeStations information")
            }
            catch {
                print("Error fetching routStations information: \(error.localizedDescription)")
            }
        }
    }
    
    private func testScheduleInfo() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = StationScheduleService(client: client, apiKey: APIKeys.yandex)
                let schedule  = try await service.getStationSchedule(station: "s9600216")
                print("Successfully fetched \(schedule) schedule information")
            }
            catch {
                print("Error fetching schedule information \(error.localizedDescription)")
            }
        }
    }
    
    private func testSchedualBetweenStations() {
        Task {
            do {
                let client = Client(serverURL: try Servers.Server1.url(), transport: URLSessionTransport())
                let service = SchedualBetweenStationsService(client: client, apiKey: APIKeys.yandex)
                let scheduleBetweenStations = try await service.getSchedualBetweenStations(
                    from: "c15",
                    to: "c213",
                    date: "2025-10-20"
                )
                print("Successfully fetched \(scheduleBetweenStations) information")
            }
            catch {
                print("Error fetching scheduleBetweenStations information \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    ContentView()
}
