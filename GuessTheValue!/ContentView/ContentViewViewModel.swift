//
//  ContentViewViewModel.swift
//  GuessTheValue!
//
//  Created by Paul Makey on 12.03.24.
//

import Foundation

final class ContentViewViewModel: ObservableObject {

    @Published var randomNumber = Double.random(in: 0...100)
    @Published var sliderValue: Float = 0.0
    
    func submitValue() {
    }
    
    func againButtonDidTapped() {
        randomNumber = Double.random(in: 0...100)
    }
    
    func computeScore() -> Double {
        let difference = abs(Double(sliderValue) - randomNumber)
        return (100 - difference) / 100
    }
}
