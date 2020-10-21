//
//  SliderAndTexts.swift
//  ColorizedApp-SwiftUI
//
//  Created by Василий Петухов on 21.10.2020.
//

import SwiftUI

struct SliderAndTexts: View {
    
    @Binding var colorValue: Double
    @State var sliderAccentColor: Color
    @State private var showAlert = false
    
    func checkValue() {
        if colorValue > 255 {
            showAlert = true
            colorValue = 255
        }
        if colorValue < 0 {
            showAlert = true
            colorValue = 0
        }
    }
    
    var body: some View {
        HStack {
            Text("\(lround(colorValue))")
                .font(.headline)
                .frame(width: 35)
                .foregroundColor(.white)
            
            Slider(value: $colorValue, in: 0...255, step: 1)
                .accentColor(sliderAccentColor)
            
            TextField(
                "\(lround(colorValue))",
                value: $colorValue,
                formatter: NumberFormatter.numbers,
                onCommit: {
                    checkValue()
                }
            )
            .alert(isPresented: $showAlert,
                   content: {
                    Alert(title: Text("Ошибка!"),
                          message: Text("Введите значение от 0 до 255"),
                          dismissButton: .cancel(Text("ОК")))
                   })
            .deleteDisabled(false)
            .keyboardType(.numbersAndPunctuation)
            .multilineTextAlignment(.center)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 45)
            
        }.padding(.horizontal, 10)
    }
}

struct SliderAndTexts_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.systemFill).ignoresSafeArea()
            SliderAndTexts(colorValue: .constant(100), sliderAccentColor: Color(.red))
        }
    }
}


// MARK:  - NumberFormatter for slider value
extension NumberFormatter {
    static var numbers: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 3
        return formatter
    }
}
