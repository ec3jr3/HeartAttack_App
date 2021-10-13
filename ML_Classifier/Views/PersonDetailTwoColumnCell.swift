//
//  PersonDetailTwoColumnCell.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/30/21.
//

import UIKit

class PersonDetailTwoColumnCell: UITableViewCell {
    
    @IBOutlet var SexTitle: UILabel!{
        didSet{
            SexTitle.text = SexTitle.text?.uppercased()
            //SexTitle.numberOfLines = 0
        }
    }
    @IBOutlet var SexLabel: UILabel!{
        didSet{
            //SexLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var BMITitle: UILabel!{
        didSet{
            BMITitle.text = BMITitle.text?.uppercased()
            //BMITitle.numberOfLines = 0
        }
    }
    @IBOutlet var BMILable: UILabel!{
        didSet{
            //BMILable.numberOfLines = 0
        }
    }
    
    @IBOutlet var BloodPTitle: UILabel!{
        didSet{
            BloodPTitle.text = BloodPTitle.text?.uppercased()
            //BloodPTitle.numberOfLines = 0
        }
    }
    @IBOutlet var BloodPLabel: UILabel!{
        didSet{
            //BloodPLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var GlucoseTitle: UILabel!{
        didSet{
            GlucoseTitle.text = GlucoseTitle.text?.uppercased()
           // GlucoseTitle.numberOfLines = 0
        }
    }
    @IBOutlet var GlucoseLabel: UILabel!{
        didSet{
            //GlucoseLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var PregnanciesTitle: UILabel!{
        didSet{
            PregnanciesTitle.text = PregnanciesTitle.text?.uppercased()
            //PregnanciesTitle.numberOfLines = 0
        }
    }
    @IBOutlet var PregnanciesLabel: UILabel!{
        didSet{
            //PregnanciesLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var SkinThicTitle: UILabel!{
        didSet{
            SkinThicTitle.text = SkinThicTitle.text?.uppercased()
           // SkinThicTitle.numberOfLines = 0
        }
    }
    @IBOutlet var SkinThicLabel: UILabel!{
        didSet{
            //SkinThicLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var DiabetesFuncTitle: UILabel!{
        didSet{
            DiabetesFuncTitle.text = DiabetesFuncTitle.text?.uppercased()
            //DiabetesFuncTitle.numberOfLines = 0
        }
    }
    @IBOutlet var DiabetesFuncLabel: UILabel!{
        didSet{
            //DiabetesFuncLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var InsulineTitle: UILabel!{
        didSet{
            InsulineTitle.text = InsulineTitle.text?.uppercased()
            //InsulineTitle.numberOfLines = 0
        }
    }
    @IBOutlet var InsulineLabel: UILabel!{
        didSet{
            //InsulineLabel.numberOfLines = 0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
