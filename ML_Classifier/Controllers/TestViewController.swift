//
//  TestViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//

import UIKit
import CoreML

class TestViewController: UIViewController {
    
    let mModel = HeartPredictionClassifier()
    
    var personTest: ProfileInfo = ProfileInfo()
    
    
    @IBOutlet var nameForTestL : UILabel!
    @IBOutlet var ResultsTitile: UILabel!{
        didSet{
            ResultsTitile.layer.cornerRadius = 8
            ResultsTitile.clipsToBounds = true
        }
    }
    
    @IBOutlet var mapButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //get the user information
        
        let age = personTest.edad
        let sex = personTest.sexo
        let ches_pain = personTest.chest_pain_type
        let bd = personTest.bp
        let cholesterol = personTest.cholesterol
        let fbs = personTest.fbs_over_120
        let ekg = personTest.ekg_results
        let max_hr = personTest.max_hr
        let exercise_angina = personTest.exercise_angina
        let st_depression = personTest.st_depressionL
        let slope_st = personTest.slope_of_st
        let num_vessels = personTest.number_of_vessels_fluro
        let thallium = personTest.thallium
        
        guard let prediction = try? mModel.prediction(Age: Double(age)!, Sex: Double(sex)!, Chest_pain_type: Double(ches_pain)!, BP: Double(bd)!, Cholesterol: Double(cholesterol)!, FBS_over_120: Double(fbs)!, EKG_results: Double(ekg)!, Max_HR: Double(max_hr)!, Exercise_angina: Double(exercise_angina)!, ST_depression: Double(st_depression)!, Slope_of_ST: Double(slope_st)!, Number_of_vessels_fluro: Double(num_vessels)!, Thallium: Double(thallium)!)
        else {
            fatalError("Unexpected runtime error")}
        nameForTestL.text = prediction.Heart_Disease
        print(prediction.Heart_DiseaseProbability)
        personTest.HeartResult.append(prediction.Heart_Disease)
        print(personTest.HeartResult)
        //print(personTest)
        let ResultPerson = personTest
        print(ResultPerson)
       // dismiss(animated: true, completion: nil)
        
        
        
        //If the person got the results from the test a botton will apear to show the map for
        //nearest hospitals
        if personTest.HeartResult == "0" || personTest.HeartResult == "1"{
            mapButton.imageView?.isHidden = false
            mapButton.isEnabled = true
        } else if personTest.HeartResult == "" {
            mapButton.imageView?.isHidden = true //we hide the button if the person doesnt have results
            mapButton.isEnabled = false //disabling the button if the person doesnt have results
        }
        
    }
}
