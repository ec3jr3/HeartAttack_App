//
//  NumberVesselsCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/16/21.
//

import UIKit

class NumberVesselsCell: UITableViewCell {
    
    @IBOutlet var NumberOfMayorVesselsLabel: UILabel!
    @IBOutlet var NumberOfMayorVesselsDescriptionLabel: UILabel! {
        didSet {
            NumberOfMayorVesselsDescriptionLabel.numberOfLines = 0
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
