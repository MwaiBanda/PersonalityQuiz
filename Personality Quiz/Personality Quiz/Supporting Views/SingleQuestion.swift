//
//  SingleQuestion.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI

struct SingleQuestion: View {
    var currentQuestion: Question
    @ObservedObject var choosenAnswer: AnswerModel
    @State var count: Int = 0
    @State var ispressed: Bool = false
    @State var selected: Answer!

    var body: some View {
        VStack(spacing: 24) {
            ForEach(currentQuestion.answers, id: \.self) { answer in  
                Button(action: {
                    if self.count == 0 {
                    self.choosenAnswer.choosenAnswer.append(answer)
                    self.selected = answer
                    }
                    self.count += 1
                }, label: {
                    Text(answer.text)
                        .foregroundColor(self.selected == answer  ? .blue : .black)
                        
                })
                
                
            }
        } .onDisappear(perform: {
            #if DEBUG
            printVal()
            #endif
            self.count = 0
        })
    }
    #if DEBUG
    func printVal() {
        print("First Answer ", choosenAnswer.choosenAnswer)
    }
    #endif
}

struct SingleQuestion_Previews: PreviewProvider {
    static var previews: some View {
        SingleQuestion(currentQuestion: questionBank[0], choosenAnswer: AnswerModel.init())
    } 
}
