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
        uiView.thumbTintColor = .red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(value: $value, alpha: $alpha)
    }
}

extension SliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Float
        @Binding var alpha: Double
        
        init(value: Binding<Float>, alpha: Binding<Double>) {
            self._value = value
            self._alpha = alpha
        }
        
        @objc func sliderValueHasChanged(_ sender: UISlider) {
            value = sender.value
            sender.thumbTintColor = .red.withAlphaComponent(alpha)
        }
    }
}
