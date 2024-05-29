//
//  ContentView.swift
//  PlayingWithDebug
//
//  Created by Ricky Suprayudi on 29/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var steps : Int = 0
    let maximumStep : Int = 100
    @State var indicatorGauge : String = "gauge.with.dots.needle.0percent"
    
    var body: some View {
        VStack {
            Image(systemName: indicatorGauge)
                .font(.system(size: 200))
                .foregroundStyle(checkStep() ? Color(.red) : Color(.blue))
            ZStack {
                HStack {
                    Text("\(steps)")
                        .bold()
                        .padding()
                        .foregroundColor(checkStep() ? Color(.red) : Color(.blue))
                    Spacer()
                }
                HStack {
                    Spacer()
                    Stepper {
                        Text("Steps of \(maximumStep)")
                    } onIncrement: {
                        steps += 1
                        indicatorGauge = checkGauge()
                    } onDecrement: {
                        steps -= 1
                        indicatorGauge = checkGauge()
                    }
                }
                .padding()
            }
            .font(.system(size: 32))
            .frame(width: 300)
        }
    }
    
    func checkStep() -> Bool {
        if steps > maximumStep {
            return true
        } else {
            return false
        }
    }
    
    func checkGauge() -> String {
        if steps <= Int(Double(maximumStep) * 0.33) {
            return "gauge.with.dots.needle.0percent"
        } else if (steps > Int(Double(maximumStep) * 0.33)) && (steps <= Int(Double(maximumStep) * 0.5)) {
            return "gauge.with.dots.needle.33percent"
        } else if (steps > Int(Double(maximumStep) * 0.5)) && (steps <= Int(Double(maximumStep) * 0.67)) {
            return "gauge.with.dots.needle.67percent"
        } else if (steps > Int(Double(maximumStep) * 0.67)) && (steps <= maximumStep) {
            return "gauge.with.dots.needle.100percent"
        } else {
            return "exclamationmark.triangle"
        }
    }
    
}

#Preview {
    ContentView()
}
