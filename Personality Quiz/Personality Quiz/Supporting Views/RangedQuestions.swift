//
//  RangedQuestions.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI

struct RangedQuestions: View {
    var currentQuestion = questionBank[2]
    @Binding var ans1: Double
    @Binding var ans2: Double
    @State var firstquestion = true
    @ObservedObject var choosenAnswer: AnswerModel
    
    
    var body: some View {
        VStack(spacing: 24) {
            Slider(value: self.$ans1, in: 0...1 , step: 1)
            HStack{
                Text(currentQuestion.answers[0].text)
                Spacer()
                Text(currentQuestion.answers[1].text)
            }
            Slider(value: self.$ans2, in: 2...3 , step: 1)
            HStack{
                Text(currentQuestion.answers[2].text)
                Spacer()
                Text(currentQuestion.answers[3].text)
            }
        }
        
    }
    func SendFirstAnswer() {
        let index1 = Int(ans1)
        self.choosenAnswer.choosenAnswer.append(currentQuestion.answers[index1])
        print(index1, "Idx 1")
        
    }
    func SendSecondAnswer() {
        let index2 = Int(ans2)
        self.choosenAnswer.choosenAnswer.append(currentQuestion.answers[index2])
        print(index2, "Idx 2")
        
    }
}


