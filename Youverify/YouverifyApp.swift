//
//  YouverifyApp.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//

import SwiftUI
import FirebaseCore


@main
struct YouverifyApp: App {
    init() {
        FirebaseApp.configure()
           }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
