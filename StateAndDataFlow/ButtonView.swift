//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Игорь Богданов on 04.08.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(25)
        //.overlay(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "logout", color: .green, action:{})
    }
}
