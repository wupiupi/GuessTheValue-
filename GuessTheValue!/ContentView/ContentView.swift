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
    @State private var sliderThumbAlpha = 1.0
    
    var body: some View {
        VStack(spacing: 25) {
            CustomText(text: "Подвиньте слайдер как можно ближе к:\n\(lrint(contentViewVM.randomNumber))")
            
            SliderViewRepresentation(
                value: $contentViewVM.sliderValue,
                alpha: $sliderThumbAlpha
            )
            .onChange(of: contentViewVM.sliderValue) { _, newValue in
                sliderThumbAlpha = contentViewVM.computeAlpha()
            }

            ButtonView(text: "Проверь меня!") {
                showAlert.toggle()
            }
                        
            ButtonView(text: "Начать заново", 
                       action: contentViewVM.buttonDidTapped
            )
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Результат"),
                message: Text("""
                Вы выбрали: \(lrintf(contentViewVM.sliderValue)).
                Точность попадания: \(contentViewVM.computeScore())%
                """),
                dismissButton: .default(
                    Text("OK"),
                    action: contentViewVM.buttonDidTapped
                )
            )
        }
            
            
            .padding()
        .onAppear {
            sliderThumbAlpha = contentViewVM.computeAlpha()
        }
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
