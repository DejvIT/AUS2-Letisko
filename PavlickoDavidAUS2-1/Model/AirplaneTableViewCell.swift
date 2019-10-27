//
//  AirplaneTableViewCell.swift
//  PavlickoDavidAUS2-1
//
//  Created by MaestroDavo on 26/10/2019.
//  Copyright © 2019 David Pavlicko. All rights reserved.
//

import UIKit

class AirplaneTableViewCell: UITableViewCell {

    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var code: UILabel!
    @IBOutlet weak var creator: UILabel!
    @IBOutlet weak var arrival: UILabel!
    @IBOutlet weak var departure: UILabel!
    @IBOutlet weak var priority: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
