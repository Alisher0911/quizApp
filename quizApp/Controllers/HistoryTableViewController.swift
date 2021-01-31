//
//  HistoryTableViewController.swift
//  quizApp
//
//  Created by Alisher on 1/31/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

struct Cell {
    var attempt: String
    var score: String
}

class HistoryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ScoreDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cells = [Cell] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
        
        cells.append(Cell(attempt: "1 attempt", score: "6/10"))
        cells.append(Cell(attempt: "2 attempt", score: "7/10"))
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if (segue.identifier == "addSegue") {
           let vc = segue.destination as! QuizViewController
           vc.delegate = self
       }
    }*/
    func passScore(newScore: String, newAttempt: String) {
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as! QuizViewController
        vc.delegate = self
        cells.append(Cell(attempt: newAttempt, score: newScore))
        tableView.reloadData()
        print(cells)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.attempt.text = cells[indexPath.row].attempt
        cell.score.text = cells[indexPath.row].score
        return cell
    }
}
