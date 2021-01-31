//
//  ViewController.swift
//  quizApp
//
//  Created by Alisher on 1/27/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func startQuiz(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as! QuizViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func showHistory(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "history") as! HistoryTableViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}

