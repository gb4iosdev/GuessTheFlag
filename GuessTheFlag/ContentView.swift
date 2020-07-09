//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Gavin Butler on 07-07-2020.
//  Copyright © 2020 Gavin Butler. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of:")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0..<3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    }
                }
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreMessage = ""
            score += 1
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That's the \(ownership((countries[number]))) flag."
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func ownership(_ country: String) -> String {
        switch country {
        case "Estonia": return "Estonian"
        case "France": return "French"
        case "Germany": return "German"
        case "Ireland": return "Irish"
        case "Italy": return "Italian"
        case "Nigeria": return "Nigerian"
        case "Poland": return "Polish"
        case "Russia": return "Russion"
        case "Spain": return "Spanish"
        case "UK": return "UK"
        case "US": return "US"
        default: return "<Unknown>"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//Alerts:
/*struct ContentView: View {
    @State private var alertShown = false
    
    var body: some View {
        Button("Show Alert") {
            self.alertShown = true  //Alerts automatically set the bound variable back to false.
        }
        .alert(isPresented: $alertShown) {
            Alert(title: Text("Hello SwiftUI"), message: Text("Detailed message goes here"), dismissButton: .default(Text("OK")))
        }
    }
}
*/


//Button long form:
/*struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Button was tapped:")
        }) {
            HStack {
                Image(systemName: "pencil").renderingMode(.original)  //Otherwise it's blue per button standard colour
                Text("Edit")
            }
        }
    }
}*/



//Button short form:
/*Button("Tap Me") {
    print("Button was tapped:")
}*/



//Gradients:
/*struct ContentView: View {
    var body: some View {
        //LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .bottomLeading, endPoint: .topTrailing)
        //RadialGradient(gradient: Gradient(colors: [.orange, .black]), center: .center, startRadius: 20, endRadius: 250).edgesIgnoringSafeArea(.all)
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
    }
}*/


//Colours and Safe Area:
/*struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.7, blue: 0.8).edgesIgnoringSafeArea(.all)
            Text("Your Content!")
        }
        
    }
}*/


//HStacks, VStacks, ZStacks:
/*struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ForEach(1..<4) {_ in
                HStack(spacing: 20) {
                    ForEach(1..<4) {_ in
                        Text("Hello")
                    }
                }
            }
        }
    }
}*/
