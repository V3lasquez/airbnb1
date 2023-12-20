import SwiftUI
import MapKit

struct TripsView: View {
    @StateObject var airbnbViewModel = AirbnbViewModel()
    @State private var region: MKCoordinateRegion?
    @State private var selectedPlace: Place? = nil
    @State private var isZoomLimitReached = false


    var body: some View {
        ZStack {
            if let region = region {
                Map(coordinateRegion: .constant(region), showsUserLocation: true, annotationItems: airbnbViewModel.placeCoordinates) { placeCoordinate in
                    MapAnnotation(coordinate: placeCoordinate.coordinate) {
                        Image("marker")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 50)
                            .onTapGesture {
                                selectedPlace = airbnbViewModel.airbnbData.first(where: { $0.name == placeCoordinate.name })
                            }
                    }
                }
                .ignoresSafeArea()
            } else {
                Text("Cargando mapa...")
                    .foregroundColor(.gray)
            }
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        // Zoom In Button
                                                Button(action: {
                                                    region?.span.latitudeDelta *= 0.8
                                                    region?.span.longitudeDelta *= 0.8
                                                }) {
                                                    Image(systemName: "plus.circle")
                                                        .resizable()
                                                        .frame(width: 32, height: 32)
                                                        .foregroundColor(.blue)
                                                        .padding()
                                                }
                                                .background(Color.white)
                                                .clipShape(Circle())
                                                .padding()
                        Button(action: {
                            if region?.span.latitudeDelta ?? 0 < 100 { // Límite superior para el zoom
                                region?.span.latitudeDelta /= 0.8
                                region?.span.longitudeDelta /= 0.8
                            }
                        }) {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.blue)
                                .padding()
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                        .padding()
                    }
                    .padding()
                }
                    Spacer()
                
                    }
            VStack {
                        Spacer()
                            if let place = selectedPlace {
                                HStack {
                                    ZStack {
                                        AsyncImage(url: URL(string: place.image_url)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 120, height: 120)
                                        
                                        Image(systemName: "xmark.circle")
                                            .background(.gray)
                                            .clipShape(Circle())
                                            .font(.system(size: 20))
                                            .offset(x: -40, y: -40)
                                            .onTapGesture {
                                                selectedPlace = nil
                                            }
                                    }

                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(place.name)
                                                .fontWeight(.semibold)
                                                .font(.caption)
                                            Spacer()
                                            Image(systemName: "heart")
                                        }
                                        Spacer()
                                        HStack {
                                            VStack {
                                                Text("Nov 19 - 24")
                                                    .fontWeight(.light)
                                                    .foregroundStyle(.gray)
                                                .font(.caption2)
                                                Text(String(format: "S/ %.2f", place.price))
                                                    .font(.caption)
                                            }
                                            
                                            Spacer()
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 11))
                                            Text(String(format: "%.2f",place.rating))
                                        }
                                        
                                    }
                                    .padding(.vertical, 8)
                                    .frame(maxHeight: 120)
                                    Spacer()
                                }
                                .background(.white)
                                .cornerRadius(16)
                            }
                        }
                        .padding()
                    }
                    .onAppear {
                        Task {
                            await airbnbViewModel.loadAirbnbData()
                            if !airbnbViewModel.placeCoordinates.isEmpty {
                                let coordinates = airbnbViewModel.placeCoordinates.map(\.coordinate)

                                if let firstCoordinate = coordinates.first {
                                    region = MKCoordinateRegion(center: firstCoordinate, span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
                                }
                            }
                        }
                    }
                }
            }

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView()
    }
}
