//
//  ContentView.swift
//  BetterSleep
//
//  Created by Niyazi on 22.09.2025.
//
import CoreML
import SwiftUI


struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert: Bool = false
    @State private var recommendedBedTime = ""
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp)
                        .labelsHidden()
                }
                .onChange(of: self.wakeUp) {
                    bedtime()
                }
                
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                        .padding(.horizontal, 20)
                }
                .onChange(of: self.sleepAmount) {
                    bedtime()
                }
                
                Section("Daily coffee intake") {
                    /*
                     Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                     .padding(.horizontal, 20)
                 */
                    Picker("Number of Cups", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) { num in
                            Text("\(num)")
                        }
                        
                    }
                }
                .onChange(of: self.coffeeAmount) {
                    bedtime()
                }
                
                Section("Recommended time for sleep...") {
                    Text("\(recommendedBedTime)")
                        .font(.largeTitle)
                }
            }
            .onAppear {
                bedtime()
            }
            
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") { bedtime()}
            } message: {
                Text(alertMessage)
            }
            .navigationTitle("BetterRest")
            
        }
        
    }
    
    func bedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            recommendedBedTime = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            showAlert = true
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
    }
    /*
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            
            alertTitle = "Your bedtime is..."
            recommendedBedTime = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        showAlert = true
        
    }
     */
}

#Preview {
    ContentView()
}
