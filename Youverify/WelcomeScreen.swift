//
//  WelcomeScreen.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//


import SwiftUI

struct WelcomeScreen: View {
    @State var signupToggle:Bool = false
    var body: some View {
            //Set Up View
        ZStack {
            Color.black
                .ignoresSafeArea()
           
            VStack(spacing: 100){
                HStack{
                   Text("Are You Hungry? Buy Food")
                  .font(.system(size: 30))
                  .foregroundStyle(
                    LinearGradient(colors: [.pink,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                  )
                 
                    
                 }
              Image("Hungry")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .frame(width: 300,height: 300)
                    .border(.white, width: 2)
                  Button("Lets Eat") {
                      signupToggle = true
                }
              .modifier(ButtonModifier())
            
            }
            
            }
        .frame(maxWidth:.infinity,maxHeight:.infinity)
            .fullScreenCover(isPresented: $signupToggle, content: {
                SignInView()
                 
           })
       }
        
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
