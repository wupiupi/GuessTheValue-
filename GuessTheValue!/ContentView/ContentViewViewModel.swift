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
   
    func buttonDidTapped() {
        sliderValue = 0
        randomNumber = Double.random(in: 0...100)
    }
    
    func computeScore() -> Int {
        let difference = abs(lrintf(sliderValue) - lrint(randomNumber))
        return 100 - difference
    }
    
    func computeAlpha() -> Double {
        Double(computeScore()) / 150
    }
}
