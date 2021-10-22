//
//  ProfileTableViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//

import UIKit
import CoreData

class ProfileTableViewController: UITableViewController{
    
    //var informaciondeUsuarios:[PersonIn] = []
    //var fetchResultController: NSFetchedResultsController<PersonIn>!
    var informaciondeUsuario:[ProfileInfo] = [
        ProfileInfo(name: "Andres", image: "image1", edad: "21", sexo: "1", chest_pain_type: "4", bp: "130", cholesterol: "322", fbs_over_120: "0", ekg_results: "2", max_hr: "109", exercise_angina: "0", st_depressionL: "2.4", slope_of_st: "2", number_of_vessels_fluro: "3", thallium: "3", Outcome: false),
        ProfileInfo(name: "Holland", image: "image3", edad: "21", sexo: "0", chest_pain_type: "4", bp: "130", cholesterol: "322", fbs_over_120: "0", ekg_results: "2", max_hr: "109", exercise_angina: "0", st_depressionL: "2.4", slope_of_st: "2", number_of_vessels_fluro: "3", thallium: "3", Outcome: false),
        ProfileInfo(name: "Celine", image: "image2", edad: "19", sexo: "0", chest_pain_type: "4", bp: "130", cholesterol: "322", fbs_over_120: "0", ekg_results: "2", max_hr: "109", exercise_angina: "0", st_depressionL: "2.4", slope_of_st: "2", number_of_vessels_fluro: "3", thallium: "3", Outcome: false)]
    
    var ResultTest: ProfileInfo = ProfileInfo()
    
    @IBOutlet var emptyProfileView: UIView!
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .singleLine
       // tableView.separatorColor = .systemYellow
        
        //enable large navigation bar tiles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //
        
        // Create a snapshot and populate the data
       //fetchRestaurantData()
        var snapshot = NSDiffableDataSourceSnapshot<Section, ProfileInfo>()
        snapshot.appendSections([.all])
        snapshot.appendItems(informaciondeUsuario, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        
        tableView.cellLayoutMarginsFollowReadableWidth = true

        //customizing the navigation bar
        if let appearance = navigationController?.navigationBar.standardAppearance
         {
            appearance.configureWithTransparentBackground()
            if let customFont = UIFont(name: "Nunito-Bold", size: 45.0) {
                appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0)]
                appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 218/255, green: 96/255, blue: 51/255, alpha: 1.0), .font: customFont]
        }
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
        
        navigationController?.hidesBarsOnSwipe = true
    
    }
   
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navBarAppearance = UINavigationBarAppearance()
        var backButtonImage = UIImage(systemName: "arrow.backward", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20.0, weight: .bold))
        backButtonImage = backButtonImage?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0))
        navBarAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    return true }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    // MARK: - UITableView Diffable Data Source
    
    //to configure the data of the table view
    func configureDataSource() -> UITableViewDiffableDataSource<Section, ProfileInfo >{
        let cellIdentifier = "datacell"
        let dataSource = PersonDiffableDataSource(
            tableView: tableView,
            cellProvider: {  tableView, indexPath, informaciondeUsuarios in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PersonTableViewCell
                cell.nameLabel.text = informaciondeUsuarios.name
                cell.ageLabel.text = informaciondeUsuarios.edad
                cell.sexLabel.text = informaciondeUsuarios.sexo
                cell.ProfilePicImage.image = UIImage(named: informaciondeUsuarios.image)
                cell.favoriteImageView.isHidden = informaciondeUsuarios.Outcome ? false : true
                
                //whenever the outcome is either "1" or "0" is going to show the image that the test was already done
                if self.ResultTest.HeartResult == "Presence"{
                    cell.TestDone.isHidden = false
                } else if informaciondeUsuarios.HeartResult == "Absence" {
                    cell.TestDone.isHidden = false
                }else if informaciondeUsuarios.HeartResult == "" {
                    cell.TestDone.isHidden = true
                }
    return cell }
            
    )
        return dataSource
    }
    
    // MARK: - UITableViewDelegate Protocol
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Mark as favorite action
       let favoriteAction = UIContextualAction(style: .destructive, title: "") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! PersonTableViewCell

            //self.informaciondeUsuario[indexPath.row].Outcome = cell.favoriteImageView.isHidden
            cell.favoriteImageView.isHidden = self.informaciondeUsuario[indexPath.row].Outcome
            
            self.informaciondeUsuario[indexPath.row].Outcome = self.informaciondeUsuario[indexPath.row].Outcome ? false : true
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        // Configure swipe action
        favoriteAction.backgroundColor = UIColor.systemYellow
        favoriteAction.image = UIImage(systemName: self.informaciondeUsuario[indexPath.row].Outcome ? "heart.slash.fill" : "heart.fill")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
            
        return swipeConfiguration
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Get the selected restaurant
        guard let infoPatient = self.dataSource.itemIdentifier(for: indexPath) else {
            return UISwipeActionsConfiguration()
        }
        
        // Delete action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([infoPatient])
            self.dataSource.apply(snapshot, animatingDifferences: true)
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        let shareAction = UIContextualAction(style: .normal, title: "Share") {
            (action, sourceView, completionHandler) in
            let defaultText = "Test Done my result is: " + infoPatient.name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            //for ipad
            if let popoverController = activityController.popoverPresentationController{
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
            } }
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        // Change the button's color
        deleteAction.backgroundColor = UIColor.systemRed
        deleteAction.image = UIImage(systemName: "trash")
        
        shareAction.backgroundColor = UIColor.systemOrange
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        // Configure both actions as swipe action
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
            
        return swipeConfiguration
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailPerson" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! ProfileDetailViewController
                destinationController.person = self.informaciondeUsuario[indexPath.row]
            }
        }
    }
    
    @IBAction func unwindToHome(for unwindSegue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
}

