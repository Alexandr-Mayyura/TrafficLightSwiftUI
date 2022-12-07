//
//  CircleLightView.swift
//  TrafficLightSwiftUI
//
//  Created by Aleksandr Mayyura on 07.12.2022.
//

import SwiftUI

struct CircleLightView: View {
    let color: Color
    let opacity: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: 100)
            .foregroundColor(color.opacity(opacity))
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
    }
}

struct CircleLightView_Previews: PreviewProvider {
    static var previews: some View {
        CircleLightView(color: .red, opacity: 1)
    }
}
