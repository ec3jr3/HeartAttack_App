//
//  VariableTextCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 11/12/21.
//

import UIKit

class VariableTextCell: UITableViewCell {
    
    @IBOutlet var MeaningVariable: UILabel! {
        didSet{
            MeaningVariable.numberOfLines = 0
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
