//
//  MessageTableViewCell.swift
//  parse-chat
//
//  Created by Gideon Goodwin on 9/9/15.
//  Copyright © 2015 Gideon Goodwin. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
