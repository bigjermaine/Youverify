//
//  DescriptiveView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//


import SwiftUI

struct DescriptiveView: View {
    var mealdetails:String?
    @StateObject var dessertviewmodel = DessertViewModel()
    var body: some View {
        NavigationView{
         
                ForEach(dessertviewmodel.mealsDetails ,id:\.self) { meal in
                    DescriptiveShowView(mealdetails: meal)
                        .frame(maxWidth:.infinity,maxHeight: .infinity)
                }
            
           }
        
        .onAppear{
            dessertviewmodel.fetchDetails(id:mealdetails ?? "")
        }
    }
     }
     
 

struct DescriptiveView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptiveView()
    }
}
