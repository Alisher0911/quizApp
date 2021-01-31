//
//  ResultViewController.swift
//  quizApp
//
//  Created by Alisher on 1/29/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var resultLabel: UILabel!
    
    var totalScore = 0
    var totalQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var quizResult = Double(totalScore) / Double(totalQuestions)
        quizResult *= 100
        resultLabel.text = "\(quizResult)%"
        
        var title = ""
        if(quizResult < 50) {
            title = "Bad"
        } else if(quizResult < 70) {
            title = "Not bad"
        } else if(quizResult < 90){
            title = "Good"
        } else {
            title = "Excellent"
        }
        
        titleLabel.text = title
    }
    
    @IBAction func restartQuiz(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as! QuizViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func goToHomePage(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
