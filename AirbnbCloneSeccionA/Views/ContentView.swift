//
//  ContentView.swift
//  AirbnbCloneSeccionA
//
//  Created by Alumno on 3/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var airbnbViewModel = AirbnbViewModel()

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 50){
                    Category(icon: "ovni", text: "OMG!")
                    Category(icon: "beaches", text: "Players")
                    Category(icon: "home", text: "Tiny Homes")
                    Category(icon: "golf", text: "Golfing")
                    Category(icon: "landscape", text: "Amazing")
                }
            }.padding()
            Divider()

            List(airbnbViewModel.airbnbData, id: \.name) { place in
                Card(place: place)
            }

            Spacer()
        }
        .task {
            await airbnbViewModel.loadAirbnbData()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
