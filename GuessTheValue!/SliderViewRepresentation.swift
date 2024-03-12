//
//  SliderViewRepresentation.swift
//  GuessTheValue!
//
//  Created by Paul Makey on 12.03.24.
//

import SwiftUI

struct SliderViewRepresentation: UIViewRepresentable {
    @Binding var value: Float
    @Binding var alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueHasChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value)
    }
}

extension SliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderValueHasChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}
