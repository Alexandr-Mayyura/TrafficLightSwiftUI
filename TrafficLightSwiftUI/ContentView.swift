//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Aleksandr Mayyura on 07.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var nameButton = "START"
    @State private var currentLight = CurrentLight.red
    
    @State private var redOpacity: CGFloat = 0.3
    @State private var yellowOpacity: CGFloat = 0.3
    @State private var greenOpacity: CGFloat = 0.3
    
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    var body: some View {
        ZStack{
            Color(.black)
                .ignoresSafeArea()
            VStack {
                CircleLightView(color: .red, opacity: redOpacity)
                    .padding(.bottom, 16)
                CircleLightView(color: .yellow, opacity: yellowOpacity)
                    .padding(.bottom, 16)
                CircleLightView(color: .green, opacity: greenOpacity)
                
                Spacer()
                
                Button(action: { startButtonPressed() }) {
                    Text(nameButton)
                        .frame(width: 180, height: 40)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                }
                .buttonStyle(.borderedProminent)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white, lineWidth: 4))

            }
            .padding()
        }
    }
    
    private func startButtonPressed() {
        if nameButton == "START" {
            nameButton = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenOpacity = lightIsOff
            redOpacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redOpacity = lightIsOff
            yellowOpacity = lightIsOn
            currentLight = .green
        case .green:
            greenOpacity = lightIsOn
            yellowOpacity = lightIsOff
            currentLight = .red
        }
    }
}

private enum CurrentLight {
       case red, yellow, green
   }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
