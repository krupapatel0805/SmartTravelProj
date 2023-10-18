//
//  DetailsScreen.swift
//  SmartTravel 1
//
//  Created by Sam 77 on 2023-10-15.
//

import SwiftUI

import SwiftUI

struct DetailsScreen: View {
    let imageURL: String
    let text: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageURL))
                .frame(width: 200, height: 200)
                .cornerRadius(12)
            Text(text)
                .font(.title)
                .padding()
        }
        .navigationTitle("Details")
    }
}


//struct DetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsScreen(imageURL: <#String#>, text: <#String#>)
//    }
//}
