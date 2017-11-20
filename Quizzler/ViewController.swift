//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer = false
    var questionNumber = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        pickedAnswer = (sender.tag == 1)
        checkAnswer()
        nextQuestion()
        updateUI()
    }
    
    
    func updateUI() {
      questionLabel.text = allQuestions.list[questionNumber].questionText
    }
    

    func nextQuestion() {
        if questionNumber == allQuestions.list.count - 1 {
            let alert = UIAlertController(title: "Awesome!", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
        
            let restartAction = UIAlertAction.init(title: "Yes", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            let cancelAction = UIAlertAction.init(title: "No", style: .cancel, handler:nil)
            
            alert.addAction(restartAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
        }else {
            questionNumber += 1
        }
    }
    
    
    func checkAnswer() {
        if pickedAnswer == allQuestions.list[questionNumber].answer {
            print("You got it")
        }else{
            print("Wrong!")
        }
    }
    
    
    func startOver() {
       questionNumber = 0
       updateUI()
    }
    

    
}
