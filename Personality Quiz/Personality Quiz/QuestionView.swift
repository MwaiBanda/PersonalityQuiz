//
//  QuestionView.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI

struct QuestionView: View {
    @State var questionNumber = 0
    @State var showModal = false
    @State var currentQuestion = questionBank
    @State var answersChosen = [Answer]()
    @State var question = Questions.singleQuestion
    @State var answer: AnimalType
    @State var ans1 = 0.0
    @State var ans2 = 2.0
    @ObservedObject var choosenAnswer = AnswerModel()
    

    enum Questions: CaseIterable {
        case singleQuestion, MultipleQuestions, RangedQuestions
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 24){
                Spacer()
                VStack{
                    Text(currentQuestion[questionNumber].text)
                        .font(.system(size: 32))
                    Group {
                        if question == .singleQuestion {
                            SingleQuestion(currentQuestion: currentQuestion[questionNumber], choosenAnswer: choosenAnswer)
                        } else if question == .MultipleQuestions {
                            MultipleQuestions(choosenAnswer: choosenAnswer)
                        } else if question == .RangedQuestions {
                            RangedQuestions(currentQuestion: currentQuestion[questionNumber], ans1: self.$ans1, ans2: self.$ans2, choosenAnswer:  self.choosenAnswer)
                            }
                    }
                    
                }
                Button( action: {
                    if questionNumber < 2 {
                        questionNumber += 1
                        question = Questions.MultipleQuestions
                        if questionNumber == 2 {
                            question = Questions.RangedQuestions
                        }
                    } else {
                        let ranged = RangedQuestions(currentQuestion: currentQuestion[questionNumber], ans1: self.$ans1, ans2: self.$ans2, choosenAnswer:  self.choosenAnswer)
                        self.showModal.toggle()
                        questionNumber = 1
                        ranged.SendFirstAnswer()
                        ranged.SendSecondAnswer()
                    }
                    
                }, label: {
                    Text("SUBMIT")
                        .padding(.all, 14.0)
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                Spacer()
                ProgressView(value: Double(questionNumber + 1), total: 3)
            }
            .padding()
        }
        .navigationBarTitle("Question #\(questionNumber + 1)", displayMode: .inline)
        .sheet(isPresented: $showModal, onDismiss: {
            self.questionNumber = 0
            self.question = Questions.singleQuestion
            self.choosenAnswer.choosenAnswer.removeAll()
        } , content: {
            ResultsView(responses: currentQuestion[questionNumber], choosenAnswer: choosenAnswer, answer: answer, showModal: $showModal)
        })
    }
}




struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(answer: AnimalType.cat)
    }
}

