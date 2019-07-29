//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank();
    var selectedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        let selectedTag = sender.tag
        if selectedTag == 1 {
            selectedAnswer = true
        } else {
            selectedAnswer = false
        }
        checkAnswer(questionNumber)
        
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
        let totalQuestions : Int = allQuestions.list.count
        questionLabel.text = allQuestions.list[questionNumber].questionText
        scoreLabel.text = String(score);
        progressLabel.text = "\(questionNumber + 1) / \(totalQuestions)"
        // below, for each divide total screen width in 13ths and for each question add one 13th
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalQuestions)) * CGFloat(questionNumber + 1)
    }
    
    func incrementScore() -> Void {
        score += 1
    }

    func nextQuestion() {
        if(questionNumber == allQuestions.list.count - 1) {
           let alert =  UIAlertController(title: "Awesome", message: "You've finished all the questions. Do you want to play again?", preferredStyle: .alert)
            print("End of quiz")
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        } else{
            questionNumber += 1
        }

    }
    
    
    func checkAnswer(_ qId: Int) -> Void {
        let isCorrect = selectedAnswer == allQuestions.list[qId].answer
        if isCorrect {
            print("you got it")
            incrementScore()
        } else {
            print("didnt get it")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
       score = 0
       updateUI()
    }
}
