//
//  ResultsView.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI



struct ResultsView: View {
    var responses: Question
    @ObservedObject var choosenAnswer: AnswerModel
    @State var answer : AnimalType
    @Binding var showModal: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {
                self.showModal = false
            }) { 
                Image(systemName: "xmark")
                    .font(.system(size: 17, weight: .bold))
                    .padding(.all, 10)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.6))
                    .clipShape(Circle())
                    .padding(.all, 4)
            }
            VStack {
                Text("You Are A \(String(answer.rawValue))!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.all, 4)
                Text(answer.definition)
                    .multilineTextAlignment(.center)
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        }
        .padding()
        .background(VisualEffectBlur(blurStyle: .systemMaterial).edgesIgnoringSafeArea(.bottom))
        .onAppear(perform: {
            calculatePersonalityResult()
        })
        .onDisappear(perform: {
            choosenAnswer.choosenAnswer.removeAll()
            print("Gone")
        })
    }
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responseTypes = choosenAnswer.choosenAnswer.map { $0.type }
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        self.answer = frequencyOfAnswers.sorted { $0.1 >
        $1.1 }.first!.key
        
        print(responseTypes)
    }
}

