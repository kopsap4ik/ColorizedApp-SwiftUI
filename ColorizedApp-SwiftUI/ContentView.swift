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
            Color(.systemTeal).edgesIgnoringSafeArea(.all) // заливка черным
            
            VStack {
                ColorBoard(red: $red, green: $green, blue: $blue)
                
                SliderAndTexts(colorValue: $red, sliderAccentColor: Color(.red))
                SliderAndTexts(colorValue: $green, sliderAccentColor: Color(.green))
                SliderAndTexts(colorValue: $blue, sliderAccentColor: Color(.blue))
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
