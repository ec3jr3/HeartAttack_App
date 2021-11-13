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
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionTextCell.self), for: indexPath) as! DescriptionTextCell
            cell.descriptionLabel.text = "Esta aplicación busca facilitar el acceso de herramientas que ayuden a predecir ataques al corazon, esto puede ayudar a tomar decisiones preliminares y servir como referencia a médicos"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VariableTextCell.self), for: indexPath) as! VariableTextCell
            cell.MeaningVariable.text = "What does each variable mean"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VersionColumnCell.self), for: indexPath) as! VersionColumnCell
            cell.VersionLabel.text = "Version 1"
            
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConnectWithUsCell.self), for: indexPath) as! ConnectWithUsCell
            cell.ConnectWithUs.text = "Connect with us"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterCell.self), for: indexPath) as! TwitterCell
            cell.TwitterLabel.text = "Follow us on Twitter"
            cell.TwiterLogoImageView.image = UIImage(named: "twitter")
            return cell
        case 5:
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
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DescriptionTextCell.self), for: indexPath) as! DescriptionTextCell
            cell.isUserInteractionEnabled = false
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: VersionColumnCell.self), for: indexPath) as! VersionColumnCell
            cell.isUserInteractionEnabled = false
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ConnectWithUsCell.self), for: indexPath) as! ConnectWithUsCell
            cell.isUserInteractionEnabled = false
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TwitterCell.self), for: indexPath) as! TwitterCell
            cell.isUserInteractionEnabled = true
            if let urlToOpen = URL(string: "https://twitter.com"){
                UIApplication.shared.open(urlToOpen, options: [:]) { (done) in
                    print("Link was opened successfully")
                }
            }
        case 4:
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


    
