//
//  ContentView.swift
//  Lesson2
//
//  Created by CC on 13/07/2020.
//  Copyright © 2020 CC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // list of countries
    @State private var countries = ["Estonia","France","Germany", "Italy","Spain","US","Nigeria","UK","Russia"].shuffled()
    // pick the correct answer randomly
    @State private var correctAnswer = Int.random(in: 0...2)
    // variables for the Alert message
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    
    var body: some View {
        ZStack{
            //background grading
            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:30){
                
                VStack{
                    
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action:{
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                            .shadow(radius: 2)
                        
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text(scoreTitle), dismissButton: .default(Text("Next...")){
                self.askQuestion()
                })
        }
        
        
    }
    
    
    
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct Answer."
        } else {
            scoreTitle = "Wrong Answer."
        }
        showingScore = true
        
    }
    
    
    func askQuestion(){
        // reshuffles flag and deisgnate the right answer
        // function called when score alert dismissed by user
        
        countries.shuffle()  // TO CHECK : what s the difference between shuffled and shuffle?
        correctAnswer = Int.random(in: 0...2)
        
    }
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
