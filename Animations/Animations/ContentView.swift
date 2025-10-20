//
//  ContentView.swift
//  Animations
//
//  Created by Niyazi on 17.10.2025.
//

import SwiftUI

struct ContentView: View {
    // @State private var animationAmount = 1.0
    // @State private var enabled = false
    
    // let letters = Array("Hello SwiftUI")
    // @State private var enabled = false
    // @State private var dragAmount = CGSize.zero
    
    // @State private var isShowingRed = false
    
    var body: some View {
        
        //asymmetric transition: enter and removal
        /*
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal:.opacity))
            }
        
        }
     */
        
        //drag gestures with letters
        /*
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
            Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
         */
        
        //drag gesture animation of card with gradient
        /*
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero }
                    }
            )
         //.animation(.bouncy, value: dragAmount)
         */
        
        //radar style button
        /*
        Button("Tap Me") {
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeInOut(duration: 1) .repeatForever(autoreverses: false),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
     */
        
        //with stepper
        /*
        Spacer()
        Stepper("Scale amount", value: $animationAmount
            .animation(.easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            .padding(.horizontal, 50)
        Text("\(animationAmount)")
        Spacer()
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(40)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .onAppear {
            animationAmount = 2
        }
        Spacer()
     */
        
        //with 3D animation
        /*
        Button("Tap Me") {
            withAnimation (
                .spring(duration: 1, bounce: 0.5)) {
                    animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(Angle(degrees: animationAmount), axis: (x: 1, y: 0, z: 1))
         
         */
        
        //toggling background color and rotating 3D
        /*
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value:enabled)
        //.scaleEffect(enabled ? 1 : 0.8)
        .foregroundStyle(Color.white)
        .clipShape(.rect(cornerRadius: enabled ? 100 : 0))
        .rotation3DEffect(Angle(degrees: enabled ? 360 : 0), axis: (x: 0.5, y: 0, z: 0.5))
        .animation(.spring(duration: 1, bounce: 0.3), value: enabled)
        .padding(100)
    */
    }
}

#Preview {
    ContentView()
}
