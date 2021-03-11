//
//  Personality_QuizApp.swift
//  Personality Quiz
//
//  Created by Mwai Banda   on 11/22/20.
//

import SwiftUI

@main
struct Personality_QuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(choosenAnswer: AnswerModel.init())
        }
    }
}
