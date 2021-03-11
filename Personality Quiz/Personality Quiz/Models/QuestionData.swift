//
//  QuestionData.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/23/20.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer: Hashable, Identifiable {
    var id : String
    var text: String
    var type: AnimalType
    var enabled: Bool
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var definition: String {
        switch self {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}


var questionBank: [Question] = [
    Question(text: "Which food do you like the most?",
             type:.single,
             answers: [
                Answer(id: "1", text: "Steak", type: .dog, enabled: false),
                Answer(id: "2", text: "Fish", type: .cat, enabled: false),
                Answer(id: "3", text: "Carrots", type: .rabbit, enabled: false),
                Answer(id: "4", text: "Corn", type: .turtle, enabled: false)
             ]),
    Question(text: "Which activities do you enjoy?",
             type: .multiple,
             answers: [
                Answer(id: "5", text: "Swimming", type: .turtle, enabled: false),
                Answer(id: "6", text: "Sleeping", type: .cat, enabled: false),
                Answer(id: "7", text: "Cuddling", type: .rabbit, enabled: false),
                Answer(id: "8", text: "Eating", type: .dog, enabled: false)
             ]),
    Question(text: "How much do you enjoy car rides?",
             type: .ranged,
             answers: [
                Answer(id: "9", text: "I dislike them", type: .cat, enabled: false),
                Answer(id: "10", text: "I get a little nervous",
                       type: .rabbit, enabled: false),
                Answer(id: "11", text: "I barely notice them",
                       type: .turtle, enabled: false),
                Answer(id: "12", text: "I love them", type: .dog, enabled: false)
             ])
]

