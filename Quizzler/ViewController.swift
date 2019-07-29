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
  
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[questionNumber]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        let selectedTag = sender.tag
        if selectedTag == 1 {
            selectedAnswer = true
        } else {
            selectedAnswer = false
        }
        let isCorrect = checkAnswer(questionNumber)
        
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
      questionLabel.text = allQuestions.list[questionNumber].questionText
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
    
    
    func checkAnswer(_ qId: Int) -> Bool{
        let isCorrect = selectedAnswer == allQuestions.list[qId].answer
        if isCorrect {
            print("you got it")
        } else {
            print("didnt get it")
        }
        return isCorrect
    }
    
    
    func startOver() {
       questionNumber = 0
       updateUI()
    }
}
