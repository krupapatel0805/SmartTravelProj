//
//  HomeScreen.swift
//  SmartTravel 1
//
//  Created by Sam 77 on 2023-10-08.
//

import SwiftUI
import CoreLocation
import Firebase
import FirebaseFirestore

struct HomeScreen: View {
    
    @State private var userLocation = "Loading..."
    private let locationManager = CLLocationManager()
    private let locationDelegate = LocationDelegate()
    
    var body: some View {
        ScrollView {
            VStack {
                HeaderView(userLocation: $userLocation)
                IntroductionView()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ImageRectangle(imageURL: "https://images.pexels.com/photos/836941/pexels-photo-836941.jpeg?auto=compress&cs=tinysrgb&w=800322x301", text: "Henghe,China")
                        ImageRectangle(imageURL: "https://images.pexels.com/photos/93049/pexels-photo-93049.jpeg?auto=compress&cs=tinysrgb&w=800382x301", text: "Campo Belo,Brazil")
                        ImageRectangle(imageURL: "https://images.pexels.com/photos/803900/pexels-photo-803900.jpeg?auto=compress&cs=tinysrgb&w=800", text: "Buseresere,Tanzania")
                        ImageRectangle(imageURL: "https://images.pexels.com/photos/9253/sea-city-landscape-sky.jpg?auto=compress&cs=tinysrgb&w=800", text: "Tío Pujio,Argentina")
                        ImageRectangle(imageURL: "https://images.pexels.com/photos/4237154/pexels-photo-4237154.jpeg?auto=compress&cs=tinysrgb&w=800", text: "Talok,Indonesia")
                    }
                }
                FilterButtons()
                FilterSection()
                    .padding(.horizontal, 20)

            }
        }
    }

        struct HeaderView: View {
            
            @Binding var userLocation: String

            var body: some View {
                HStack {
                    //                Menu Button
                    Button(action: {
                        // Add the action you want to perform when the button is tapped
                    }) {
                        Image("menu")
                            .resizable()
                            .frame(width: 35, height: 25)
                            .padding(.vertical, 3.88)
                    }
                    
                    Spacer()
                    
                    //                        Current Location
                    Text("\(userLocation)")
                                    .font(Font.custom("Montserrat", size: 18.11).weight(.light))
                                    .foregroundColor(Color(red: 0.42, green: 0.47, blue: 0.54))
                    
                    Spacer()
                    
                    
//                       User Account
                    NavigationLink(destination: UserProfile()) {
                        ZStack {
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 46.57, height: 49.15)
                                .background(Color(red: 0.13, green: 0.15, blue: 0.16).opacity(0.20))
                                .offset(x: -0, y: 3.88)
                                .blur(radius: 15.52)
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 51.74, height: 51.74)
                                .background(.white)
                                .offset(x: 0, y: -2.59)
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 25.87, height: 25.87)
                                .background(Color(red: 0.17, green: 0.21, blue: 0.26).opacity(0.55))
                                .offset(x: -0, y: 7.76)
                                .blur(radius: 5.17)
                            Ellipse()
                                .foregroundColor(.clear)
                                .frame(width: 41.39, height: 41.39)
                                .background(
                                    AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/3247/3247933.png/41x41"))
                                )
                                .offset(x: -0, y: -2.59)
                        }
                    }

                }
            }
        }
    }
    
struct IntroductionView: View {
    var body: some View {
        VStack(alignment: .leading){
            // Introduction
            Text("Hi John,")
                .font(Font.custom("Montserrat", size: 24).weight(.light))
                .foregroundColor(Color(red: 0.22, green: 0.25, blue: 0.30))
            Text("Where do you wanna go?")
                .font(Font.custom("Montserrat", size: 35).weight(.bold))
                .lineSpacing(30)
                .foregroundColor(Color(red: 0.04, green: 0.15, blue: 0.33))
        }
    }
}

struct FilterButtons: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                Spacer()
                FilterButton(title: "Popular", icon: "flame.fill")
                FilterButton(title: "Lake", icon: "water.waves")
                FilterButton(title: "Beach", icon: "beach.umbrella")
                FilterButton(title: "Mountain", icon: "mountain.2.fill")
            }
        }
    }
}

struct FilterButton: View {
    var title: String
    var icon: String

    var body: some View {
        Button(action: {
            // Add the action for the filter button
        }) {
            HStack(spacing: 5) {
                Image(systemName: icon)
                    .foregroundColor(.white)
                Text(title)
                    .font(Font.custom("Montserrat", size: 18.11))
                    .lineSpacing(24)
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 10.35, leading: 7.76, bottom: 10.35, trailing: 12.94))
            .frame(width: 140, height: 50)
            .background(Color(red: 0.39, green: 0.56, blue: 0.89))
            .cornerRadius(6.47)
        }
    }
}


struct FilterSection: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                FilterItem(imageURL: "https://images.pexels.com/photos/325944/pexels-photo-325944.jpeg?auto=compress&cs=tinysrgb&w=800/282x300/259x151", title: "Áno Kopanákion", location: "Greece", rating: "4.8")
                FilterItem(imageURL: "https://images.pexels.com/photos/9253/sea-city-landscape-sky.jpg?auto=compress&cs=tinysrgb&w=800/259x151", title: "Tío Pujio", location: "Argentina", rating: "4.5")
                FilterItem(imageURL: "https://images.pexels.com/photos/9253/sea-city-landscape-sky.jpg?auto=compress&cs=tinysrgb&w=800/259x151", title: "Tío Pujio", location: "Argentina", rating: "4.5")
                FilterItem(imageURL: "https://images.pexels.com/photos/9253/sea-city-landscape-sky.jpg?auto=compress&cs=tinysrgb&w=800/259x151", title: "Tío Pujio", location: "Argentina", rating: "4.5")
            }
        }
    }
}

struct FilterItem: View {
    var imageURL: String
    var title: String
    var location: String
    var rating: String

    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 281.99, height: 253.53)
                .background(.white)
                .cornerRadius(20.70)
                .overlay(
                    RoundedRectangle(cornerRadius: 20.70)
                        .inset(by: -0.65)
                        .stroke(Color(red: 0.93, green: 0.93, blue: 0.94), lineWidth: 0.65)
                )
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 258.71, height: 151.34)
                .background(
                    AsyncImage(url: URL(string: imageURL))
                )
                .cornerRadius(12.94)
                .offset(y: 10)
            Text(title)
                .font(Font.custom("Montserrat", size: 20.70))
                .lineSpacing(27.94)
                .foregroundColor(Color(red: 0.04, green: 0.15, blue: 0.33))
                .offset(x: -50, y: 170)
            Text(location)
                .font(Font.custom("Montserrat", size: 15.52).weight(.light))
                .lineSpacing(20.96)
                .foregroundColor(Color(red: 0.42, green: 0.47, blue: 0.54))
                .offset(x: -90, y: 200)
            Text(rating)
                .font(Font.custom("Montserrat", size: 18.11).weight(.light))
                .lineSpacing(24.45)
                .foregroundColor(Color(red: 0.22, green: 0.25, blue: 0.30))
                .offset(x: 110, y: 185)
        }
    }
}

            
    class LocationDelegate: NSObject, CLLocationManagerDelegate {
        var onUpdateLocation: ((CLLocation) -> Void)?
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                onUpdateLocation?(location)
            }
        }
    }
    struct ImageRectangle: View {
        var imageURL: String
        var text: String
        
        var body: some View {
            ZStack(alignment: .bottomLeading) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 380, height: 350)
                    .background(
                        AsyncImage(url: URL(string: imageURL))
                    )
                    .cornerRadius(42)
                    .padding(20)
            
                Text(text)
                    .font(Font.custom("Montserrat", size: 23.28))
                    .lineSpacing(31.43)
                    .foregroundColor(.white)
                    .padding(40)
                    
            }
        }
    }
    
    struct HomeScreen_Previews: PreviewProvider {
        static var previews: some View {
            HomeScreen()
        }
    }
