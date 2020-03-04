//
//  ContentView.swift
//  Breathe
//
//  Created by Chris Parker on 4/3/20.
//  Copyright © 2020 Chris Parker. All rights reserved.
//

import SwiftUI

struct BlueCircle: View {
    @State private var offsetInOut = false
    var body: some View {
        ZStack {
        Circle()
            .foregroundColor(Color(red: 0, green: 1, blue: 1))
            .opacity(1/2)
            .frame(width: 150, height: 150)
            .offset(x: offsetInOut ? -75 : 0)
        }
        .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
        .onAppear() {
            self.offsetInOut.toggle()
        }
    }
}


struct ContentView: View {
    @State private var scaleInOut = false
    @State private var rotateInOut = false

    var body: some View {
        ZStack {
            ForEach(0..<6) { circle in
                BlueCircle()
                .rotationEffect(.degrees(Double(circle) * 60))
            }
        }
        .rotationEffect(.degrees(rotateInOut ? 180 : 0))
        .scaleEffect(scaleInOut ? 1 : 0.15)
        .animation(Animation.easeInOut.repeatForever(autoreverses: true).speed(1/8))
        .onAppear() {
            self.scaleInOut.toggle()
            self.rotateInOut.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
