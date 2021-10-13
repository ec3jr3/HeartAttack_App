//
//  PersonDetailTextCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/30/21.
//

import UIKit

class PersonDetailTextCell: UITableViewCell {
    
    @IBOutlet var edadTitle: UILabel! {
        didSet {
            edadTitle.text = edadTitle.text?.uppercased()
            edadTitle.numberOfLines = 0
        }
    }
    @IBOutlet var edadLabel: UILabel!{
        didSet{
            edadLabel.numberOfLines = 0
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
