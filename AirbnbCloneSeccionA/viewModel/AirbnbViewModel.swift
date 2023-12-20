//
//  AirbnbViewModel.swift
//  AirbnbCloneSeccionA
//
//  Created by MAC32 on 1/12/23.
//

import Foundation
import MapKit

class AirbnbViewModel: ObservableObject {
    @Published var airbnbData: [Place] = []
    @Published var placeCoordinates: [PlaceCoordinate] = []
    
    func loadAirbnbData() async {
        guard let url = URL(string: "https://airbnb-api-jhoselin19s-projects.vercel.app/airbnb") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let result = try decoder.decode(AirbnbData.self, from: data)

            DispatchQueue.main.async {
                self.airbnbData = result.places
                self.placeCoordinates = result.places.map { PlaceCoordinate(name: $0.name, coordinate: CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)) }
            }

        } catch let error {
            print(error.localizedDescription)
        }
    }
}
