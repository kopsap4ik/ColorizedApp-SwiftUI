//
//  ColorBoard.swift
//  ColorizedApp-SwiftUI
//
//  Created by Василий Петухов on 20.10.2020.
//

import SwiftUI

struct ColorBoard: View {
    
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
            .frame(maxWidth: .infinity,maxHeight: 200)
            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 3))
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
}

struct ColorBoard_Previews: PreviewProvider {
    static var previews: some View {
        ColorBoard(red: .constant(0), green: .constant(100), blue: .constant(255))
    }
}
