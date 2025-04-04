//
//  DescriptiveShowView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import SwiftUI

struct DescriptiveShowView: View {
    @EnvironmentObject var  dessertcore:DessertCoreDataViewmodel
    @State private var dataSavedPresented = false
    var mealdetails:MealDetail?
    var body: some View {
        ScrollView{
            VStack(spacing:20){
                HStack{
                    if let url = mealdetails?.strMealThumb {
                        AsyncImage(url: URL(string:url)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth:250,maxHeight:250)
                                .cornerRadius(8)
                            
                            
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                if let mealdetails = mealdetails {
                    VStack(alignment:.leading,spacing:10){
                        Text("Name:\(mealdetails.strMeal)")
                            .foregroundStyle(
                                LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                        
                        HStack {
                            Text("click to add Cart😁")
                                .foregroundStyle(.red)
                                .padding()
                            Button{
                                dataSavedPresented = true
                                dessertcore.addBooking(Name: mealdetails.strMeal)
                                dessertcore.cartCount += 1
                                                  
                                }label:{
                                Image(systemName: "cart.fill")
                                .foregroundColor(.yellow)
                                }
                                                   
                        }
                        Text("instructions")
                        ScrollView {
                            Text(mealdetails.strInstructions)
                                .foregroundColor(.red)
                                .lineLimit(nil)
                        }
                        
                        
                        Text(" Ingredients")
                            .fontWeight(.semibold)
                        .foregroundColor(.white)
                        
                        List{
                            Group {
                                Text("\(mealdetails.strIngredient1) \(mealdetails.strMeasure1)")
                                Text("\(mealdetails.strIngredient2 ?? "") \(mealdetails.strMeasure2 ?? "")")
                                Text("\(mealdetails.strIngredient3 ?? "") \(mealdetails.strMeasure3 ?? "")")
                                Text("\(mealdetails.strIngredient4 ?? "") \(mealdetails.strMeasure4 ?? "")")
                                Text("\(mealdetails.strIngredient5 ?? "") \(mealdetails.strMeasure5 ?? "")")
                                Text("\(mealdetails.strIngredient6 ?? "") \(mealdetails.strMeasure6 ?? "")")
                                Text("\(mealdetails.strIngredient7 ?? "") \(mealdetails.strMeasure7 ?? "")")
                                Text("\(mealdetails.strIngredient8 ?? "") \(mealdetails.strMeasure8 ?? "")")
                                Text("\(mealdetails.strIngredient9 ?? "") \(mealdetails.strMeasure9 ?? "")")
                            }
                           
                        }
                       
                        
                    }
                }
            }
            .frame(maxWidth:.infinity,maxHeight:.infinity)
            .padding()
        }
        .alert("Added to Cart", isPresented: $dataSavedPresented, actions: {
            
               })
    }
}

struct DescriptiveShowView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptiveShowView()
    }
}
