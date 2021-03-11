//
//  MultipleQuestions.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI

struct MultipleQuestions: View {
    @State var currentQuestion = questionBank[1]
    @ObservedObject var choosenAnswer: AnswerModel

    
    var body: some View {
        VStack(spacing: 24){
            ForEach(0..<currentQuestion.answers.count) { i in
                Toggle(currentQuestion.answers[i].text, isOn: self.$currentQuestion.answers[i].enabled.didSet(execute: {_ in 
                    self.choosenAnswer.choosenAnswer.append(currentQuestion.answers[i])
                }))
                .toggleStyle(SwitchToggleStyle(tint: .blue))
            }
        }
    }
}

extension Binding {
    func didSet(execute: @escaping (Value) -> Void) -> Binding {
        return Binding(
            get: {
                return self.wrappedValue
            },
            set: {
                self.wrappedValue = $0
                execute($0)
            }
        )
    }
}
struct MultipleQuestions_Previews: PreviewProvider {
    static var previews: some View {
        MultipleQuestions(currentQuestion: questionBank[1], choosenAnswer: AnswerModel.init())
    }
}
