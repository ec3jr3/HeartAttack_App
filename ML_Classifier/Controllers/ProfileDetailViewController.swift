//
//  ProfileDetailViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/30/21.
//

import UIKit

class ProfileDetailViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: PersonDetailHeaderView!

    var person: ProfileInfo = ProfileInfo()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure the navigation bar appearance
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.hidesBarsOnSwipe = false
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        //configure header view
        headerView.nameLabel.text = person.name
        headerView.headerImageView.image = UIImage(named: person.image)
        
        // Configure the data source
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
                           
}

extension ProfileDetailViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        { return 2 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:PersonDetailTextCell.self), for: indexPath) as! PersonDetailTextCell
            cell.edadLabel.text = person.edad
            //cell.descriptionLabel.text = restaurant.description
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonDetailTwoColumnCell.self), for: indexPath) as! PersonDetailTwoColumnCell
            //cell.column1TitleLabel.text = "Address"
            cell.SexLabel.text = person.sexo
            cell.BMILable.text = person.BMI
            cell.BloodPLabel.text = person.BloodPressure
            cell.GlucoseLabel.text = person.Glucose
            cell.PregnanciesLabel.text = person.pregnancies
            cell.SkinThicLabel.text = person.SkinThickness
            cell.DiabetesFuncLabel.text = person.DiabetesPredigreeFunc
            cell.InsulineLabel.text = person.Insuline
                return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }
}
