//
//  FacebookCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/7/21.
//

import UIKit

class FacebookCell: UITableViewCell {
    
    @IBOutlet var FacebookLabel: UILabel! {
        didSet {
            FacebookLabel.numberOfLines = 0
        }
    }
    @IBOutlet var FacebookLogoImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
