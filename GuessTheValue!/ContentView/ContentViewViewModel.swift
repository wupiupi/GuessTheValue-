//
//  ContentViewViewModel.swift
//  GuessTheValue!
//
//  Created by Paul Makey on 12.03.24.
//

import Foundation

final class ContentViewViewModel: ObservableObject {
    enum ScoreResults {
        case excellent
        case good
        case notBad
        case bad
        
        var description: String {
            switch self {
                case .excellent:
                    "И палка раз в год стреляет!"
                case .good:
                    "Да это ж круто, ну круто!"
                case .notBad:
                    "Сомнительнооооо... Ну, окЭй"
                case .bad:
                    "Видимо, у вас косоглазие. Керзовые сапоги помогут вам! Годен!"
            }
        }
    }

    @Published var randomNumber = Double.random(in: 0...100)
    @Published var sliderValue: Float = 0.0
    
    func getResult(withScore score: Int) -> String {
        let result: ScoreResults
        
        switch score {
            case 0...33:
                result = .bad
            case 34...66:
                result = .notBad
            case 66...98:
                result = .good
            default:
                result = .excellent
        }
        
        return result.description
    }
   
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
