//
//  ContentView.swift
//  timesTables
//
//  Created by Ranbir Khaira on 2025-03-30.
//

import SwiftUI

struct ContentView: View {
    @State private var gameOn = false //settings or game
    @State private var timesTables = 2 //times table
    @State private var numberOfQuestions = 5 //number of questions
    struct Question {
        var question: String
        var answer: Int
    }//question
    @State private var questions = [Question]()//array of questions
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0
    @State private var gameOver = false

    var body: some View {
        VStack {
            if !gameOn {
                            Text("Select your settings")
                                .font(.headline)
                            Stepper("Up to \(timesTables)", value: $timesTables, in: 2...12)
                            Picker("Number of Questions", selection: $numberOfQuestions) {
                                ForEach([5, 10, 20], id: \.self) { num in
                                    Text("\(num)")
                                }
                            }
                            .pickerStyle(.segmented)
                            
                            Button("Start Game") {
                                startGame()
                            }
                            .padding()
                        }//if game is not on, settings page, stepper for picking which times tables to use, picker for number of questions. button to start game, calls start game function.
            else if !gameOver {
                            Text(questions[currentQuestionIndex].question)
                                .font(.largeTitle)
                            TextField("Your Answer", text: $userAnswer)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            Button("Submit") {
                                checkAnswer()
                            }
                            .padding()
                        }//if game is on but not over, show question from question array, show ur answer using text field, submit and check answer.
            else {
                            Text("Game Over! Your score: \(score)/\(numberOfQuestions)")
                                .font(.headline)
                            Button("Play Again") {
                                gameOn = false
                            }
                            .padding()
                        }//if game is over, show score, and give play again option to restore to inital state.
            
            
            
        }
        
    }
    func startGame() {
            questions = generateQuestions()
            currentQuestionIndex = 0
            score = 0
            gameOver = false
            gameOn = true
    }//generates questions, resets index,score, game over and turns game on..
    func generateQuestions() -> [Question] {
            var generatedQuestions = [Question]()
            let allMultiples = (2...timesTables).flatMap { num in (1...10).map { (num, $0) } }
            let selectedQuestions = allMultiples.shuffled().prefix(numberOfQuestions)
            
            for (num, multiplier) in selectedQuestions {
                generatedQuestions.append(Question(question: "\(num) x \(multiplier)", answer: num * multiplier))
            }
            
            return generatedQuestions
    }//returns a list with questions.  does wild shit i no understand.
    func checkAnswer() {
            if let userAnswerInt = Int(userAnswer), userAnswerInt == questions[currentQuestionIndex].answer {
                score += 1
            }
            userAnswer = ""
            
            if currentQuestionIndex + 1 < numberOfQuestions {
                currentQuestionIndex += 1
            } else {
                gameOver = true
            }
    }
    //if answer correct scoreup
    //if game not over increase index for list, else game is over.
}

#Preview {
    ContentView()
}
