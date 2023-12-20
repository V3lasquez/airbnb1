//
//  TabItem.swift
//  AirbnbCloneSeccionA
//
//  Created by MAC32 on 10/11/23.
//

import SwiftUI

struct TabItem: View {
    
    var icon: String
    var text: String
    
    var body: some View {
        VStack{
            Text(text)
            Image(icon)
                .renderingMode(.template)
        }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(icon: "heart", text: "Wishlist")
    }
}
