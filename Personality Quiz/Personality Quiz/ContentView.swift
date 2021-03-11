//
//  ContentView.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var choosenAnswer: AnswerModel

    var body: some View {
        ZStack(alignment: .top ) {
            NavigationView {
                VStack(spacing: 12) {
                    HStack {
                        Text("🐶")
                            .padding()
                            .font(.system(size: 30))
                        Spacer()
                        Text("🐱")
                            .padding()
                            .font(.system(size: 30))
                    }
                    Spacer()
                    Text("Which Animal Are You?")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    Text("Select the button below to begin your personality quiz.")
                        .multilineTextAlignment(.center)
                        .padding(.bottom,10)
                    NavigationLink(
                        destination: QuestionView(answer: AnimalType.cat),
                        label: {
                        Text("BEGIN QUIZ")
                            .padding(.all, 14.0)
                            .background(Color.init(.black))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                    })
                    Spacer()
                    HStack {
                        Text("🐰")
                            .padding()
                            .font(.system(size: 30))
                        Spacer()
                        Text("🐢")
                            .padding()
                            .font(.system(size: 30))
                    }
                }
                .padding()
                .navigationBarHidden(true)
                .onAppear(perform: {
                    self.choosenAnswer.choosenAnswer.removeAll()
                })
            }
           

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(choosenAnswer: AnswerModel.init())
    }
}
