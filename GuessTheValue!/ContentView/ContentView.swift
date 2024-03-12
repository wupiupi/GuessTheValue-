//
//  ContentView.swift
//  GuessTheValue!
//
//  Created by Paul Makey on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var contentViewVM: ContentViewViewModel
    @State private var showAlert = false
    @State private var sliderThumbAlpha = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            CustomText(text: "Подвиньте слайдер как можно ближе к:\n\(lrint(contentViewVM.randomNumber))")
            
            SliderViewRepresentation(
                value: $contentViewVM.sliderValue,
                alpha: .constant(Double(0.5))
            )

            ButtonView(text: "Проверь меня!") {
                showAlert.toggle()
            }
                        
            ButtonView(text: "Начать заново", 
                       action: contentViewVM.againButtonDidTapped
            )
        }
        .alert("Результат:", isPresented: $showAlert, actions: {}) {
            Text("Ты еблан. \(lrintf(contentViewVM.sliderValue))")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
}

struct ButtonView: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
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
            .multilineTextAlignment(.center)
    }
}
