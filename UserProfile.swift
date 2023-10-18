//
//  UserProfile.swift
//  SmartTravel 1
//
//  Created by Sam 77 on 2023-10-15.
//

import SwiftUI

struct UserProfile: View {
    var body: some View {
        VStack {
            Text("User Profile")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
