//
//  VersionColumnCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/6/21.
//

import UIKit

class VersionColumnCell: UITableViewCell {
    
    @IBOutlet var VersionLabel: UILabel! {
        didSet {
            VersionLabel.text = VersionLabel.text?.uppercased()
            VersionLabel.numberOfLines = 0
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
