//
//  AppState.swift
//  AirbnbCloneSeccionA
//
//  Created by MAC32 on 24/11/23.
//

import Foundation

class AppState: ObservableObject {
    
    static let shared = AppState()

    enum Views {
        case login
        case main
    }
    
    @Published var currentScreen: Views = .main

}
