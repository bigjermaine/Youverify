//
//  ContentView.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("onboarding") var isonBoardingViewActive:Bool = true
    var body: some View {
        ZStack {
            if isonBoardingViewActive {
                WelcomeScreen()
            }else{
                TabBar()
            }
        }
    }
}

#Preview {
    ContentView()
}
