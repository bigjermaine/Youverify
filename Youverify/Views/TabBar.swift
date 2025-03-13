//
//  TabBar.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import SwiftUI

struct TabBar: View {
    @StateObject var dessertviewmodel = DessertViewModel()
    @StateObject var  dessertcore = DessertCoredataViewmodel()
    var body: some View {
        TabView{
           BrowseView()
                .environmentObject(dessertviewmodel)
                .environmentObject(dessertcore)
                .tabItem {
                    Image(systemName: "house")
                    Text("Browse")
                }
            FavouritesView()
                .badge(dessertcore.cartCount)
                .environmentObject(dessertcore)
               .tabItem {
                   Image(systemName: "books.vertical.fill")
                   Text("Favourites")
               }
           ProfileView()
             .tabItem {
                 Image(systemName: "gear")
                 Text("Settings")
             }
            
        }
        .accentColor(.purple)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
