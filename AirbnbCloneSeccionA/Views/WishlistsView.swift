//
//  WishlistsView.swift
//  AirbnbCloneSeccionA
//
//  Created by Alumno on 10/11/23.
//

import SwiftUI
import MapKit

struct WishlistsView: View {
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: -12.04552, longitude: -76.95265),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.01)
        )

    var body: some View {
        ZStack{
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            VStack{
                Spacer()
                HStack{
                    VStack {
                        Rectangle()
                            .frame(height: 3)
                            .cornerRadius(6)
                            .padding([.leading, .trailing, .bottom])
                            .frame(width: 70)
                            .padding(.top, 20)
                            .foregroundColor(Color.gray)
                        Text("60 homes")
                            .fontWeight(.semibold)
                        ZStack {
                            Image("cuarto")
                                .resizable()
                                .cornerRadius(16)
                                .padding()
                            Image(systemName: "heart")
                                .font(.system(size: 25))
                                .foregroundColor(Color.white)
                                .offset(x: 150, y: -98)
                            Image(systemName: "heart.fill")
                                .font(.system(size: 22))
                                .foregroundColor(Color.gray)
                                .offset(x: 150, y: -98)
                            Text("Superhost")
                                .font(.system(size: 15))
                                .padding(6)
                                .background(Color.white)
                                .cornerRadius(5)
                                .offset(x: -120, y: -99)
                        }
                    }
                    .frame(maxHeight: 380)
                }
                .background(.white)
                .cornerRadius(40)
            }
        }
    }
}


struct WishlistsView_Previews: PreviewProvider {
    static var previews: some View {
        WishlistsView()
    }
}
