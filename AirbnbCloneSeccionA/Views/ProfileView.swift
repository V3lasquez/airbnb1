//
//  ProfileView.swift
//  AirbnbCloneSeccionA
//
//  Created by Alumno on 10/11/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading, spacing: 10) {
                Image("item1")
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                Text("Hi I'm Jhoselin")
                    .font(.title2)
                Text("Joined in 2021")
                    .foregroundStyle(.gray)
                Divider()
                    .padding(.vertical)
                VStack(alignment: .leading, spacing: 20) {
                    Text("Identity verification")
                        .font(.title3)
                    Text("Show others you're really you with the identity verification badge")
                    Button {
                        
                    } label: {
                        Text("Get the badge")
                            .padding()
                            .foregroundStyle(.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6).stroke(Color.black)
                            )
                    }
                }
                Divider()
                    .padding(.vertical)
                HStack {
                    Image(systemName: "pencil.circle")
                    Text("Some info is shown in its orginal language.")
                }
                Text("Matt confirmed")
                    .font(.title2)
                    .padding(.top)
                    .fontWeight(.semibold)
            }.padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
