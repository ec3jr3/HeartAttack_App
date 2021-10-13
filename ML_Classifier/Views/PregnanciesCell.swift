//
//  PregnanciesCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/10/21.
//

import UIKit

class PregnanciesCell: UITableViewCell {
    
    @IBOutlet var PregnancieLabel: UILabel!
    @IBOutlet var PregnancieDescriptionLabel: UILabel! {
        didSet{
            PregnancieDescriptionLabel.numberOfLines = 0
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
