//
//  BMICell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/10/21.
//

import UIKit

class BMICell: UITableViewCell {
    
    @IBOutlet var BMILabel: UILabel!
    @IBOutlet var BMIDescriptionLabel : UILabel! {
        didSet {
            BMIDescriptionLabel.numberOfLines = 0
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
