//
//  PersonDetailHeaderView.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/30/21.
//

import UIKit

class PersonDetailHeaderView: UIView {

    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }

}
