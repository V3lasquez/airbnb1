//
//  Category.swift
//  AirbnbCloneSeccionA
//
//  Created by Alumno on 3/11/23.
//

import SwiftUI

struct Category: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        VStack{
            Image(icon)
                .font(.system(size: 28, weight: .light))
                .foregroundColor(.gray)
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
            Text(text)
                .padding(.top, 2)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
        }
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category(icon: "ovni", text: "OMG!")
    }
}
