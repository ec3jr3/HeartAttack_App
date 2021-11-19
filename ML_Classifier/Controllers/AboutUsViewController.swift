//
//  AboutUsViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/6/21.
//

import UIKit
import MessageUI

class AboutUsViewController: UIViewController {
    
    var personEdit: ProfileInfo = ProfileInfo()

    @IBOutlet var headerImageView: AboutUsLogoView!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .systemBackground
        
        //enable large navigation bar tiles
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //configuring header view
        headerImageView.LogoImageView.image = UIImage(named: "heartlogo")
        
        //cell separator
        tableView.separatorColor = .systemYellow
        
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton){
        showMailComposer()
    }
    
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["eacc9999@outlook.com"])
        composer.setSubject("HELP!")
        composer.setMessageBody("I love the app", isHTML: false)
        
        present(composer, animated: true)
    }
}
//email composer
extension AboutUsViewController: MFMailComposeViewControllerDelegate {
   
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        if let _ = error {
            //show error alert
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .saved:
            print("Saved")
        case .sent:
            print("Email Sent")
        case .failed:
            print("Failed to send")
        }
        
        controller.dismiss(animated: true)
    }
}

extension AboutUsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleTextCell.self), for: indexPath) as! TitleTextCell
            cell.TitleLabel.text = "This app has 4 goals:"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionTextCell.self), for: indexPath) as! DescriptionTextCell
            cell.descriptionLabel.text = "1) Improve the process of analysis and prediction of coronary heart disease using machine learning tools.                                      2) Make a resource that helps the general public.                                                                  3) Give medical professionals a helpful tool.                    4) Help people identify heart disease early and thus enter treatment as soon as possible."
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VariableTextCell.self), for: indexPath) as! VariableTextCell
            cell.MeaningVariable.text = "Classifier metrics:                                    Accuracy: 0.85                                                                  Absence Precision:0.80, Absence Recall:0.92, Absence f1-score:0.80                                                                 Presence Precision:0.92, Presence Recall:0.79, Presence f1-score:0.85    "
            return cell
        case 3: let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DataSetTextCell.self), for: indexPath) as! DataSetTextCell
            cell.DataSetLabel.text = "Data set link"
            return cell
        case 4: let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoreInfoTextCell.self), for: indexPath) as! MoreInfoTextCell
            cell.Moreinfor.text = "More informacion About Classifier Metrics"
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VersionColumnCell.self), for: indexPath) as! VersionColumnCell
            cell.VersionLabel.text = "Version 1"
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConnectWithUsCell.self), for: indexPath) as! ConnectWithUsCell
            cell.ConnectWithUs.text = "Connect with us"
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterCell.self), for: indexPath) as! TwitterCell
            cell.TwitterLabel.text = "Follow us on Twitter"
            cell.TwiterLogoImageView.image = UIImage(named: "twitter")
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FacebookCell.self), for: indexPath) as! FacebookCell
            cell.FacebookLabel.text = "Like on Facebook"
            cell.FacebookLogoImageView.image = UIImage(named: "facebook")

            return cell
        default:
            fatalError("Failed to instantiate the table view cell for About Us view controller")
        }
    }
    
    
    
    //this function is enable whenever the user taps a cell in a tableView
    //there are 5 cases because there are 6 prototype cells
    //one case for each cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TitleTextCell.self), for: indexPath) as! TitleTextCell
            cell.isUserInteractionEnabled = false
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionTextCell.self), for: indexPath) as! DescriptionTextCell
            cell.isUserInteractionEnabled = false
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VariableTextCell.self), for: indexPath) as! VariableTextCell
            cell.isUserInteractionEnabled = false
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DataSetTextCell.self), for: indexPath) as! DataSetTextCell
            cell.isUserInteractionEnabled = true
            if let urlToOpen = URL(string: "https://data.world/informatics-edu/heart-disease-prediction"){
                UIApplication.shared.open(urlToOpen, options: [:]) { (done) in
                    print("Link was opened successfully")
                }
            }
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MoreInfoTextCell.self), for: indexPath) as! MoreInfoTextCell
            cell.isUserInteractionEnabled = true
            if let urlToOpen = URL(string: "https://blog.exsilio.com/all/accuracy-precision-recall-f1-score-interpretation-of-performance-measures/"){
                UIApplication.shared.open(urlToOpen, options: [:]) { (done) in
                    print("Link was opened successfully")
                }
            }
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VersionColumnCell.self), for: indexPath) as! VersionColumnCell
            cell.isUserInteractionEnabled = false
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConnectWithUsCell.self), for: indexPath) as! ConnectWithUsCell
            cell.isUserInteractionEnabled = false
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterCell.self), for: indexPath) as! TwitterCell
            cell.isUserInteractionEnabled = true
            if let urlToOpen = URL(string: "https://twitter.com"){
                UIApplication.shared.open(urlToOpen, options: [:]) { (done) in
                    print("Link was opened successfully")
                }
            }
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FacebookCell.self), for: indexPath) as! FacebookCell
            cell.isUserInteractionEnabled = true
            if let urlToOpen = URL(string: "https://www.facebook.com") {
                UIApplication.shared.open(urlToOpen, options: [:]) { (done) in
                    print("Link was opened successfully")
                }
            }
        default:
            fatalError("Failed to instantiate the table view cell for About Us view controller")
        }
    
    }
}


    
