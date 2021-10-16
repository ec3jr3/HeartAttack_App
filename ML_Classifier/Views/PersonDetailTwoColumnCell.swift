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
    
    @IBOutlet var chest_pain_typeTitle: UILabel!{
        didSet{
            chest_pain_typeTitle.text = chest_pain_typeTitle.text?.uppercased()
            //BMITitle.numberOfLines = 0
        }
    }
    @IBOutlet var chest_pain_typeLable: UILabel!{
        didSet{
            //BMILable.numberOfLines = 0
        }
    }
    
    @IBOutlet var bpTitle: UILabel!{
        didSet{
            bpTitle.text = bpTitle.text?.uppercased()
            //BloodPTitle.numberOfLines = 0
        }
    }
    @IBOutlet var bpLabel: UILabel!{
        didSet{
            //BloodPLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var cholesterolTitle: UILabel!{
        didSet{
            cholesterolTitle.text = cholesterolTitle.text?.uppercased()
           // GlucoseTitle.numberOfLines = 0
        }
    }
    @IBOutlet var cholesterolLabel: UILabel!{
        didSet{
            //GlucoseLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var fbs_over_120Title: UILabel!{
        didSet{
            fbs_over_120Title.text = fbs_over_120Title.text?.uppercased()
            //PregnanciesTitle.numberOfLines = 0
        }
    }
    @IBOutlet var fbs_over_120Label: UILabel!{
        didSet{
            //PregnanciesLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var ekg_resultsTitle: UILabel!{
        didSet{
            ekg_resultsTitle.text = ekg_resultsTitle.text?.uppercased()
           // SkinThicTitle.numberOfLines = 0
        }
    }
    @IBOutlet var ekg_resultsLabel: UILabel!{
        didSet{
            //SkinThicLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var max_hrTitle: UILabel!{
        didSet{
            max_hrTitle.text = max_hrTitle.text?.uppercased()
            //DiabetesFuncTitle.numberOfLines = 0
        }
    }
    @IBOutlet var max_hrLabel: UILabel!{
        didSet{
            //DiabetesFuncLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var exercise_anginaTitle: UILabel!{
        didSet{
            exercise_anginaTitle.text = exercise_anginaTitle.text?.uppercased()
            //exercise_anginaTitle.numberOfLines = 0
        }
    }
    @IBOutlet var exercise_anginaLabel: UILabel!{
        didSet{
            //exercise_anginaLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var st_depressionLTitle: UILabel!{
        didSet{
            st_depressionLTitle.text = st_depressionLTitle.text?.uppercased()
            //st_depressionLTitle.numberOfLines = 0
        }
    }
    @IBOutlet var st_depressionLLabel: UILabel!{
        didSet{
            //st_depressionLLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var slope_of_stTitle: UILabel!{
        didSet{
            slope_of_stTitle.text = slope_of_stTitle.text?.uppercased()
            //exercise_anginaTitle.numberOfLines = 0
        }
    }
    @IBOutlet var slope_of_stLabel: UILabel!{
        didSet{
            //slope_of_stLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet var number_of_vessels_fluroTitle: UILabel!{
        didSet{
            number_of_vessels_fluroTitle.text = number_of_vessels_fluroTitle.text?.uppercased()
            //number_of_vessels_fluroTitle.numberOfLines = 0
        }
    }
    @IBOutlet var number_of_vessels_fluroLabel: UILabel!{
        didSet{
            //number_of_vessels_fluroLabel.numberOfLines = 0
        }
    }

    @IBOutlet var thalliumTitle: UILabel!{
        didSet{
            thalliumTitle.text = thalliumTitle.text?.uppercased()
            //thalliumTitle.numberOfLines = 0
        }
    }
    @IBOutlet var thalliumLabel: UILabel!{
        didSet{
            //thalliumLabel.numberOfLines = 0
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
