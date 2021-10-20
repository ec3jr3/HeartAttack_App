//
//  PersonDetailHeaderView.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/30/21.
//

import UIKit

class PersonDetailHeaderView: UIView {

    @IBOutlet var headerImageView: UIImageView!{
        didSet{
            headerImageView.layer.cornerRadius = 8
            headerImageView.clipsToBounds = true

        }
    }
    @IBOutlet var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }

}
