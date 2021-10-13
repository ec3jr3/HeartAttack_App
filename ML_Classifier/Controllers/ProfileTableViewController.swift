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
        ProfileInfo(name: "Andres", edad: "21", sexo: "Male", image: "image1", pregnancies: "6", Glucose: "148", BloodPressure: "72", SkinThickness: "35", Insuline: "0", BMI: "33.6", DiabetesPredigreeFunc: "0.627", Outcome: false),
        ProfileInfo(name: "Holland", edad: "19", sexo: "Female", image: "image3", pregnancies: "0", Glucose: "82", BloodPressure: "64", SkinThickness: "24", Insuline: "0", BMI: "26.6", DiabetesPredigreeFunc: "0.321",Outcome: false),
        ProfileInfo(name: "Celine", edad: "20", sexo: "Female", image: "image2", pregnancies: "0", Glucose: "85", BloodPressure: "66", SkinThickness: "29", Insuline: "0", BMI: "26.6", DiabetesPredigreeFunc: "0.351", Outcome: false),
        ProfileInfo(name: "Daniel", edad: "22", sexo: "male", image: "image1", pregnancies: "0", Glucose: "87", BloodPressure: "66", SkinThickness: "29", Insuline: "0", BMI: "27.6", DiabetesPredigreeFunc: "0.351",Outcome: false),
        ProfileInfo(name: "Celine", edad: "23", sexo: "male", image: "image1", pregnancies: "0", Glucose: "84", BloodPressure: "66", SkinThickness: "29", Insuline: "0", BMI: "23.6", DiabetesPredigreeFunc: "0.351",Outcome: false),
        ProfileInfo(name: "Celine", edad: "18", sexo: "male", image: "image1", pregnancies: "0", Glucose: "82", BloodPressure: "66", SkinThickness: "29", Insuline: "0", BMI: "24.6", DiabetesPredigreeFunc: "0.351",Outcome: false),
        ProfileInfo(name: "Rj", edad: "17", sexo: "male", image: "image1", pregnancies: "0", Glucose: "81", BloodPressure: "66", SkinThickness: "29", Insuline: "0", BMI: "28.6", DiabetesPredigreeFunc: "0.351",Outcome: false)]
    @IBOutlet var emptyProfileView: UIView!
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = dataSource
        tableView.separatorStyle = .singleLine
        
        //enable large navigation bar tiles
        navigationController?.navigationBar.prefersLargeTitles = true
        
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

