//
//  TitleTextCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 11/16/21.
//

import UIKit

class TitleTextCell: UITableViewCell {
    
    @IBOutlet var TitleLabel: UILabel! {
        didSet{
            TitleLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
