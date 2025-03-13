//
//  BrowseView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import SwiftUI

struct BrowseView: View {
    @EnvironmentObject var dessertviewmodel:DessertViewModel
    var columns = [GridItem(.adaptive(minimum: 150),spacing: 40)]
    var body: some View {
        NavigationView {
            ScrollView {
            LazyVGrid(columns:columns){
                ForEach(dessertviewmodel.meals, id:\.self) { meal in
                    NavigationLink(destination: DescriptiveView(mealdetails: meal.idMeal)){
                    ScrollSection(meal:meal)
                }
                }
               }
                
             }
            .navigationBarTitle("Home🍰")
            
            }
            .foregroundColor(.white)
            .navigationViewStyle(.stack)
            .navigationViewStyle(.stack)
           
         }
        
        
    }

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
            .environmentObject(dessertViewModel)
    }
}
