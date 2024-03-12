//
//  ContentView.swift
//  GuessTheValue!
//
//  Created by Paul Makey on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 50.0
        
    var body: some View {
        VStack(spacing: 20) {
            CustomText(text: "Подвиньте слайдер как можно ближе к: ")
            
            ButtonView(text: "Проверь меня!") {
            }
                        
            ButtonView(text: "Начать заново") {
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ButtonView: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {}) {
            Text(text)
                .font(.headline)
        }
    }
}

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
    }
}
