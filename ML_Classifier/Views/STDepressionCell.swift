//
//  STDepressionCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/16/21.
//

import UIKit

class STDepressionCell: UITableViewCell {
    
    @IBOutlet var STDepressionLabel: UILabel!
    @IBOutlet var STDepressionDescriptionLabel: UILabel! {
        didSet {
            STDepressionDescriptionLabel.numberOfLines = 0
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
