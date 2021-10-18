//
//  TestViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//

import UIKit

class TestViewController: UIViewController {
    
    var personTest: ProfileInfo = ProfileInfo()
    
    @IBOutlet var nameForTestL : UILabel!
    
    @IBOutlet var mapButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //get the user information
        nameForTestL.text = personTest.name
        
        //If the person got the results from the test a botton will apear to show the map for
        //nearest hospitals
        if personTest.DiabetesResult == "0" || personTest.DiabetesResult == "1"{
            mapButton.imageView?.isHidden = false
            mapButton.isEnabled = true
        } else if personTest.DiabetesResult == "" {
            mapButton.imageView?.isHidden = true //we hide the button if the person doesnt have results
            mapButton.isEnabled = false //disabling the button if the person doesnt have results
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
