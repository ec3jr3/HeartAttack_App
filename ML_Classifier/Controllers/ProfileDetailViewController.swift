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
        { return 3 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonDetailThreeColumnCell.self), for: indexPath) as! PersonDetailThreeColumnCell
            cell.Test.text = "Run Test"
               return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:PersonDetailTextCell.self), for: indexPath) as! PersonDetailTextCell
            cell.edadLabel.text = person.edad
            //cell.descriptionLabel.text = restaurant.description
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonDetailTwoColumnCell.self), for: indexPath) as! PersonDetailTwoColumnCell
            //cell.column1TitleLabel.text = "Address"
            cell.SexLabel.text = person.sexo
            cell.chest_pain_typeLable.text = person.chest_pain_type
            cell.bpLabel.text = person.bp
            cell.cholesterolLabel.text = person.cholesterol
            cell.fbs_over_120Label.text = person.fbs_over_120
            cell.ekg_resultsLabel.text = person.ekg_results
            cell.max_hrLabel.text = person.max_hr
            cell.exercise_anginaLabel.text = person.exercise_angina
            cell.st_depressionLLabel.text = person.st_depressionL
            cell.slope_of_stLabel.text = person.slope_of_st
            cell.number_of_vessels_fluroLabel.text = person.number_of_vessels_fluro
            cell.thalliumLabel.text = person.thallium
                return cell
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "runTest" {
                let destinationController = segue.destination as! TestViewController
                destinationController.personTest = self.person
            }
        /*else if segue.identifier == "editPerson" {
            let destinationController = segue.destination as! NewPersonController
            destinationController.personEdit = self.person
            }*/
        }
}
