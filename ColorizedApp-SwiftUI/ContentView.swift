//
//  ContentView.swift
//  ColorizedApp-SwiftUI
//
//  Created by Василий Петухов on 20.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red: Double = 15
    @State private var green: Double = 100
    @State private var blue: Double = 200
    
    var body: some View {
        ZStack{
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            
            VStack {
                ColorBoard(red: red, green: green, blue: blue)
                
                SliderAndTexts(colorValue: $red, sliderAccentColor: .red)
                SliderAndTexts(colorValue: $green, sliderAccentColor: .green)
                SliderAndTexts(colorValue: $blue, sliderAccentColor: .blue)
                
                Spacer()
            }
        }.onTapGesture{ UIApplication.shared.endEditing() } // hide keyboard when tap
    }
}

// MARK:  - ext for hide keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
