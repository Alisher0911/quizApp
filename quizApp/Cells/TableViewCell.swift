//
//  TableViewCell.swift
//  quizApp
//
//  Created by Alisher on 1/31/21.
//  Copyright © 2021 Alisher. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var attempt: UILabel!
    @IBOutlet weak var score: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
