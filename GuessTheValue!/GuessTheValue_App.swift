//
//  GuessTheValue_App.swift
//  GuessTheValue!
//
//  Created by Paul Makey on 12.03.24.
//

import SwiftUI

@main
struct GuessTheValue_App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ContentViewViewModel())
        }
    }
}
