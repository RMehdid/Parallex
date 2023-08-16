//
//  Home.swift
//  Parallax
//
//  Created by Samy Mehdid on 16/8/2023.
//

import SwiftUI

struct Home: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 16){
                HStack(spacing: 12) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                    
                    HStack(spacing: 12){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(Color.gray.opacity(0.1).cornerRadius(.infinity))
                }
                
                Text("Where do you want to \nTravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                
                /// Parallax
                GeometryReader{ geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 10) {
                            ForEach(TripCard.tripCards){ card in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: cardSize.width, height: cardSize.height, alignment: .center)
                                        .cornerRadius(15)
                                        .shadow(color: .black.opacity(0.25 ), radius: 8, x: 5, y:10)
                                }
                                .frame(width: size.width - 60, height: size.height - 50)
                            }
                        }
                        .padding(.horizontal, 30)
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollIndicators(.hidden)
                }
                .frame(height: 500)
                .padding(.horizontal, -16)
                .padding(.top, 10)
            }
            .padding(16)
        }
        .scrollIndicators(.hidden)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
