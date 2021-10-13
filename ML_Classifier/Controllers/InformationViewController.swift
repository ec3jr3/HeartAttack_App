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
    }
}
extension InformationViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        { return 7 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: InsulineCell.self),for: indexPath) as! InsulineCell
            cell.insulineDescriptionLabel.text = " 2-Hour serum insulin (mu U/ml)"
        return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PregnanciesCell.self), for: indexPath) as! PregnanciesCell
            cell.PregnancieDescriptionLabel.text = "Number of times pregnant"
        return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: GlucoseCell.self), for: indexPath) as! GlucoseCell
            cell.GlucoseDescriptionLabel.text = "Plasma glucose concentration over 2 hours in an oral glucose tolerance test"
        return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BloodPressureCell.self), for: indexPath) as! BloodPressureCell
            cell.BloodPressureDescriptionLabel.text = "Diastolic blood pressure (mm Hg)"
        return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SkinThicknessCell.self), for: indexPath) as! SkinThicknessCell
            cell.SkinThicknessDescriptionLabel.text = "Triceps skin fold thickness (mm)"
        return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BMICell.self), for: indexPath) as! BMICell
            cell.BMIDescriptionLabel.text = "Body mass index (weight in kg/(height in m)2)"
        return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DiabetesFuncCell.self), for: indexPath) as! DiabetesFuncCell
            cell.DiabetesFuncDescriptionLabel.text = "Diabetes pedigree function (a function which scores likelihood of diabetes based on family history)"
        return cell
        default:
            fatalError("Failed to instantiate the table view cell for About Us view controller")
        }
    }
}
