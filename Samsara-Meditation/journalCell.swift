//
//  journalCell.swift
//  FinalProject
//
//  Created by Shaomik Sarkar on 11/14/16.
//  Copyright © 2016 Shaomik Sarkar. All rights reserved.
//

import UIKit

class journalCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var jDate: UILabel!
    @IBOutlet weak var jTitle: UILabel!
    var contents = ""
    var images =  UIImage (named: "dream.jpeg")

}
