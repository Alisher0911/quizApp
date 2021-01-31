//
//  QuizViewController.swift
//  quizApp
//
//  Created by Alisher on 1/27/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

struct Question {
    let question: String
    let answers: [String]
    let correctAnswer: Int
    var isAnswered: Bool
}

protocol ScoreDelegate: class {
    func passScore(newScore: String, newAttempt: String)
}

class QuizViewController: UIViewController {
    var delegate: ScoreDelegate?
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet var questionNumber: UILabel!
    
    
   var questions: [Question] = [
        Question(
            question: "What is 1+1?",
            answers: ["1", "2", "3", "4"],
            correctAnswer: 1,
            isAnswered: false),
        Question(
            question: "What is 2+2?",
            answers: ["1", "2", "3", "4"],
            correctAnswer: 3,
            isAnswered: false),
        Question(
            question: "What is 4! ?",
            answers: ["24", "4", "10", "120"],
            correctAnswer: 0,
            isAnswered: false),
        Question(
            question: "What is 5*5?",
            answers: ["10", "25", "100", "125"],
            correctAnswer: 1,
            isAnswered: false),
        Question(
            question: "What is 10/2?",
            answers: ["1", "10", "5", "2"],
            correctAnswer: 2,
            isAnswered: false),
        Question(
            question: "What is 10-11?",
            answers: ["-1", "1", "10", "11"],
            correctAnswer: 0,
            isAnswered: false),
        Question(
            question: "What is 15*6?",
            answers: ["15", "120", "60", "90"],
            correctAnswer: 3,
            isAnswered: false),
        Question(
            question: "What is 0! ?",
            answers: ["0", "1", "2", "No correct answer"],
            correctAnswer: 1,
            isAnswered: false),
        Question(
            question: "What is 12/6?",
            answers: ["6", "2", "3", "12"],
            correctAnswer: 1,
            isAnswered: false),
        Question(
            question: "Do you like this quiz?",
            answers: ["Yes", "No", "Perhaps", "Which quiz?"],
            correctAnswer: 0,
            isAnswered: false)
    ]
    
    var currentQuestion: Question?
    var currentQuestionPosition = 0

    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
    }
    
    
    @IBAction func submitAnswer0(_ sender: UIButton) {
        checkAnswer(i: 0, sender)
    }
    
    @IBAction func sumbitAnswer1(_ sender: UIButton) {
        checkAnswer(i: 1, sender)
    }
    
    @IBAction func submitAnswer2(_ sender: UIButton) {
        checkAnswer(i: 2, sender)
    }
    
    @IBAction func submitAnswer3(_ sender: UIButton) {
        checkAnswer(i: 3, sender)
    }
    
    func checkAnswer(i: Int, _ sender: UIButton) {
        if(i == currentQuestion!.correctAnswer) {
            score += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        answer0.isEnabled = false
        answer1.isEnabled = false
        answer2.isEnabled = false
        answer3.isEnabled = false
        questions[currentQuestionPosition].isAnswered = true
    }
    
    var attempt: Int = 1
    
    @IBAction func nextQuestion(_ sender: Any) {
        if(currentQuestionPosition + 1 < questions.count) {
            nextButton.setTitle("Next", for: .normal)
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        } else {
            performSegue(withIdentifier: "quizResult", sender: nil)
            
            delegate?.passScore(newScore: "\(score)", newAttempt: "\(attempt) attempt")
            dismiss(animated: true, completion: nil)
            attempt += 1
        }
    }
    
    @IBAction func prevQuestion(_ sender: Any) {
        if(currentQuestionPosition + 1 == 1) {
            prevButton.isHidden = true
            prevButton.isEnabled = false
        } else {
            prevButton.isHidden = false
            prevButton.isEnabled = true
            currentQuestionPosition -= 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    
    func setQuestion() {
        if(currentQuestionPosition + 1 == 1) {
            prevButton.isHidden = true
            prevButton.isEnabled = false
        } else {
            prevButton.isHidden = false
            prevButton.isEnabled = true
        }
        
        if(currentQuestionPosition + 1 == questions.count) {
            nextButton.setTitle("Finish", for: .normal)
        } else {
            nextButton.setTitle("Next", for: .normal)
        }
        
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer0.backgroundColor = UIColor.opaqueSeparator
        
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer1.backgroundColor = UIColor.opaqueSeparator
        
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer2.backgroundColor = UIColor.opaqueSeparator
        
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        answer3.backgroundColor = UIColor.opaqueSeparator
        
        questionNumber.text = "\(currentQuestionPosition + 1) / \(questions.count)"
        
        if(currentQuestion?.isAnswered == true) {
            answer0.isEnabled = false
            answer1.isEnabled = false
            answer2.isEnabled = false
            answer3.isEnabled = false
        } else {
            answer0.isEnabled = true
            answer1.isEnabled = true
            answer2.isEnabled = true
            answer3.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "quizResult") {
            let vc = segue.destination as! ResultViewController
            vc.totalScore = score
            vc.totalQuestions = questions.count
        }
    }
}
