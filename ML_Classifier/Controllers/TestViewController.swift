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
    
    @IBOutlet var mapButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //get the user information
        //nameForTestL.text = personTest.name
        
        var age = personTest.edad
        var sex = personTest.sexo
        var ches_pain = personTest.chest_pain_type
        var bd = personTest.bp
        var cholesterol = personTest.cholesterol
        var fbs = personTest.fbs_over_120
        var ekg = personTest.ekg_results
        var max_hr = personTest.max_hr
        var exercise_angina = personTest.exercise_angina
        var st_depression = personTest.st_depressionL
        var slope_st = personTest.slope_of_st
        var num_vessels = personTest.number_of_vessels_fluro
        var thallium = personTest.thallium
        
        guard let prediction = try? mModel.prediction(Age: Double(age)!, Sex: Double(sex)!, Chest_pain_type: Double(ches_pain)!, BP: Double(bd)!, Cholesterol: Double(cholesterol)!, FBS_over_120: Double(fbs)!, EKG_results: Double(ekg)!, Max_HR: Double(max_hr)!, Exercise_angina: Double(exercise_angina)!, ST_depression: Double(st_depression)!, Slope_of_ST: Double(slope_st)!, Number_of_vessels_fluro: Double(num_vessels)!, Thallium: Double(thallium)!)
        else {
            fatalError("Unexpected runtime error")}
        nameForTestL.text = prediction.Heart_Disease
        print(prediction.Heart_DiseaseProbability)
       // dismiss(animated: true, completion: nil)
        
        print(age)
        print(sex)
        
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
