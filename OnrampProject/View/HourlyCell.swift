//
//  HourlyCell.swift
//  OnrampProject
//
//  Created by Rose Egle on 3/3/20.
//

import UIKit

class HourlyCell: UITableViewCell {

    
    @IBOutlet weak var hourLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
