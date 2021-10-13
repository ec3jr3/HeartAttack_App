//
//  PersonTableViewCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var sexLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var ProfilePicImage: UIImageView! {
        didSet {
           /* ProfilePicImage.layer.cornerRadius = 18.0
            ProfilePicImage.clipsToBounds = true*/
            ProfilePicImage.layer.cornerRadius = ProfilePicImage.bounds.width / 2
            ProfilePicImage.clipsToBounds = true
        }
    }
    @IBOutlet var favoriteImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.tintColor = .systemYellow
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
