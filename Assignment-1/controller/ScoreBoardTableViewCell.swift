//
//  ScoreBoardTableViewCell.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-12.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit

class ScoreBoardTableViewCell: UITableViewCell {

    @IBOutlet weak var pscore: UILabel!
    @IBOutlet weak var pname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
