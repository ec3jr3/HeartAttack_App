//
//  InformationViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/9/21.
//

import UIKit

class InformationViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Configure the data source
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemYellow
    }
}
extension InformationViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        { return 11 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ThalliumCell.self),for: indexPath) as! ThalliumCell
            cell.ThalliumDescriptionLabel.text = "Thal:                                                                              3 = normal;                                                                    6 = fixed defect;                                                                           7 = reversable defect;"
        return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CholesterolCell.self), for: indexPath) as! CholesterolCell
            cell.CholesterolDescriptionLabel.text = "Serum cholestoral in mg/dl"
        return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ChestPainTypeCell.self), for: indexPath) as! ChestPainTypeCell
            cell.ChestPainTypeDescriptionLabel.text = "Chest pain type                                                         Value 1: typical angina.                                                  Value 2: atypical angina.                                                   Value 3: non-anginal pain.                                            Value 4: asymptomatic"
        return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MaximumHeartRateCell.self), for: indexPath) as! MaximumHeartRateCell
            cell.MaximumHeartRateDescriptionLabel.text = "Maximum heart rate achieved "
        return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FastinBSCell.self), for: indexPath) as! FastinBSCell
            cell.FastinBloodSDescriptionLabel.text = "(Fasting blood sugar > 120 mg/dl)                             (1 = true; 0 = false) "
        return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestingBloodPressureCell.self), for: indexPath) as! RestingBloodPressureCell
            cell.RestingBloodPressureDescriptionLabel.text = "Resting blood pressure                                                (in mm Hg on admission to the hospital) "
        return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: NumberVesselsCell.self), for: indexPath) as! NumberVesselsCell
            cell.NumberOfMayorVesselsDescriptionLabel.text = "Number of major vessels (0-3) colored by flourosopy "
        return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ExerciseInducedAnginaCell.self), for: indexPath) as! ExerciseInducedAnginaCell
            cell.ExerciseInducedAnginaDescriptionLabel.text = "Exercise induced angina (1 = yes; 0 = no) "
        return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TheSlopeExerciseSTCell.self), for: indexPath) as! TheSlopeExerciseSTCell
            cell.TheSlopeExerciseSTDescriptionLabel.text = "The slope of the peak exercise ST segment.          Value 1: upsloping.                                                                     Value 2: flat.                                                                              Value 3: downsloping "
            return cell
        case 9:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: STDepressionCell.self), for: indexPath) as! STDepressionCell
            cell.STDepressionDescriptionLabel.text = "Oldpeak = ST depression induced by exercise relative to rest "
            return cell
        case 10:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestingElectroCell.self), for: indexPath) as! RestingElectroCell
            cell.RestingElectroDescriptionLabel.text = "Resting electrocardiographic results.                                                               Value 0: normal.                                                                            Value 1: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV).                                                                            Value 2: showing probable or definite left ventricular hypertrophy by Estes' criteria "
            return cell
        default:
            fatalError("Failed to instantiate the table view cell for About Us view controller")
        }
    }
}
