//
//  AppDelegate.swift
//  AirbnbCloneSeccionA
//
//  Created by MAC32 on 24/11/23.
//
import SwiftUI
import Foundation
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
