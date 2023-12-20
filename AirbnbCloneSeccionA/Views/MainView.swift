//
//  MainView.swift
//  AirbnbCloneSeccionA
//
//  Created by Alumno on 10/11/23.
//

import SwiftUI

struct MainView: View {
    init() {
            UITabBar.appearance().backgroundColor = UIColor.white
        }
    var body: some View {
        TabView {
            
            ContentView()
                .tabItem {
                    TabItem(icon: "magnifing", text: "Explore")
                }
            WishlistsView()
                .tabItem {
                    TabItem(icon: "heart", text: "Wishlist")
                }
            TripsView()
                .tabItem {
                    TabItem(icon: "logo-icon", text: "Trips")
                }
            InboxView()
                .tabItem {
                    TabItem(icon: "inbox", text: "Inbox")
                }
            ProfileView()
                .tabItem {
                    TabItem(icon: "profile", text: "Profile")
                }
        }
        .accentColor(Color("AirbnbPrimary"))
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
