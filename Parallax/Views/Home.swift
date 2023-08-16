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
                    .background(.ultraThinMaterial, in: .capsule)
                }
                
                Text("Where do you want to \nTravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                
                /// Parallax
                GeometryReader{ geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal){
                        HStack(spacing: 5) {
                            ForEach(TripCard.tripCards){ card in
                                GeometryReader { proxy in
                                    let cardSize = proxy.size
                                    let minX = min((proxy.frame(in: .scrollView).minX * 1.4), proxy.size.width * 1.4)
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaleEffect(1.25)
                                        .offset(x: -minX)
                                        .frame(width: cardSize.width, height: cardSize.height, alignment: .center)
                                        .cornerRadius(15)
                                        .shadow(color: .black.opacity(0.25 ), radius: 8, x: 5, y:10)
                                }
                                .frame(width: size.width - 60, height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
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
