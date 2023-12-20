//
//  AirbnbCloneSeccionAApp.swift
//  AirbnbCloneSeccionA
//
//  Created by Alumno on 3/11/23.
//

import SwiftUI

@main
struct AirbnbCloneSeccionAApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var appState: AppState = .shared
    
    var body: some Scene {
        WindowGroup {
            switch appState.currentScreen {
            case .login:
                LoginView()
            case .main:
                MainView()
            }
        }
    }
}
