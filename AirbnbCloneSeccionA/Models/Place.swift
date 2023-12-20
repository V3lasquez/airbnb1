//
//  Place.swift
//  AirbnbCloneSeccionA
//
//  Created by MAC32 on 15/12/23.
//

import Foundation

import MapKit

struct AirbnbData: Codable {
    let places: [Place]
}

struct Place: Codable{
    let name: String
    let rating: Double
    let location: Location
    let image_url: String
    let date: String
    let price: Double
}

struct PlaceCoordinate: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
