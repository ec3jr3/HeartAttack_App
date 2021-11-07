//
//  QuickTestViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 11/5/21.
//

import UIKit

class QuickTestViewController: UITableViewController {
    
    var classifier = HeartPredictionClassifier()
    
    @IBOutlet var ageTextField: RoundedBorderTextField! {
        didSet {
            ageTextField.tag = 1
            ageTextField.keyboardType = .asciiCapableNumberPad
            ageTextField.delegate = self
        }
    }
    @IBOutlet var sexTextField: RoundedBorderTextField! {
        didSet {
            sexTextField.tag = 2
            sexTextField.delegate = self
        }
    }
    @IBOutlet var thalliumTextField:
    RoundedBorderTextField! {
        didSet{
            thalliumTextField.tag = 3
            thalliumTextField.keyboardType = .asciiCapableNumberPad
            thalliumTextField.delegate = self
        }
    }
    @IBOutlet var ChestPainTextField: RoundedBorderTextField! {
        didSet {
            ChestPainTextField.tag = 4
            ChestPainTextField.keyboardType = .asciiCapableNumberPad
            ChestPainTextField.delegate = self
        }
    }
    @IBOutlet var HeartRateTextField: RoundedBorderTextField! {
        didSet {
            HeartRateTextField.tag = 5
            HeartRateTextField.keyboardType = .asciiCapableNumberPad
            HeartRateTextField.delegate = self
        }
    }
    @IBOutlet var RbloodPressureTextField: RoundedBorderTextField! {
        didSet {
            RbloodPressureTextField.tag = 6
            RbloodPressureTextField.keyboardType = .asciiCapableNumberPad
            RbloodPressureTextField.delegate = self
        }
    }
    @IBOutlet var MajorVesselsTextField: RoundedBorderTextField! {
        didSet {
            MajorVesselsTextField.tag = 7
            MajorVesselsTextField.keyboardType = .asciiCapableNumberPad
            MajorVesselsTextField.delegate = self
        }
    }
    @IBOutlet var CholesterolTextField: RoundedBorderTextField! {
        didSet {
            CholesterolTextField.tag = 8
            CholesterolTextField.keyboardType = .asciiCapableNumberPad
            CholesterolTextField.delegate = self
        }
    }
    @IBOutlet var FastingBloodSugarTextField: RoundedBorderTextField! {
        didSet {
            FastingBloodSugarTextField.tag = 9
            FastingBloodSugarTextField.keyboardType = .asciiCapableNumberPad
            FastingBloodSugarTextField.delegate = self
        }
    }
    @IBOutlet var ExerciseInducedTextField: RoundedBorderTextField! {
        didSet {
            ExerciseInducedTextField.tag = 10
            ExerciseInducedTextField.keyboardType = .asciiCapableNumberPad
            ExerciseInducedTextField.delegate = self
        }
    }
    @IBOutlet var TheSlopeofPeakExerciseTextField: RoundedBorderTextField! {
        didSet {
            TheSlopeofPeakExerciseTextField.tag = 11
            TheSlopeofPeakExerciseTextField.keyboardType = .asciiCapableNumberPad
            TheSlopeofPeakExerciseTextField.delegate = self
        }
    }
    @IBOutlet var StDepressionTextField: RoundedBorderTextField! {
        didSet {
            StDepressionTextField.tag = 12
            StDepressionTextField.keyboardType = .asciiCapableNumberPad
            StDepressionTextField.delegate = self
        }
    }
    @IBOutlet var RestinElectroCardiographicTextField: RoundedBorderTextField! {
        didSet {
            RestinElectroCardiographicTextField.tag = 13
            RestinElectroCardiographicTextField.keyboardType = .asciiCapableNumberPad
            RestinElectroCardiographicTextField.delegate = self
        }
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize the navigation bar appearance
            if let appearance = navigationController?.navigationBar.standardAppearance {
                if let customFont = UIFont(name: "Nunito-Bold", size: 40.0) {
                    appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!]
                    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "NavigationBarTitle")!, .font: customFont] }
                navigationController?.navigationBar.standardAppearance = appearance
                navigationController?.navigationBar.compactAppearance = appearance
                navigationController?.navigationBar.scrollEdgeAppearance = appearance
                
            }
        
        // Dismiss keyboard when users tap any blank area of the view
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        //instructions for whenever the user tries to do the quick test
        if ageTextField.text == "" {
            let TutorialController = UIAlertController(title: "Instructions", message: "Make sure that all the fields are fill", preferredStyle:.alert)
            let TutorialAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
            TutorialController.addAction(TutorialAction)
            self.present(TutorialController, animated: true, completion: nil)
        }
    }
    @IBAction func test(){
        
        //aletr controller menu
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        present(optionMenu, animated: true, completion: nil)
        
        //cancell action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:nil)
        optionMenu.addAction(cancelAction)
        
        //run test axction
        let TestActionHandle =  { (action:UIAlertAction!) -> Void in
            
            //let age = Double(self.ageTextField.text!) ?? 0.0
            let age = Double(self.ageTextField.text!) //?? 0.00
            let sex = Double(self.sexTextField.text!)// ?? 0.0
            let ches_pain = Double(self.ChestPainTextField.text!)// ?? 0.0
            let bd = Double(self.RbloodPressureTextField.text!)// ?? 0.0
            let cholesterol = Double(self.CholesterolTextField.text!)// ?? 0.0
            let fbs = Double(self.FastingBloodSugarTextField.text!)// ?? 0.0
            let ekg = Double(self.RestinElectroCardiographicTextField.text!)// ?? 0.0
            let max_hr = Double(self.HeartRateTextField.text!)// ?? 0.0
            let exercise_angina = Double(self.ExerciseInducedTextField.text!)// ?? 0.0
            let st_depression = Double(self.StDepressionTextField.text!)// ?? 0.0
            let slope_st = Double(self.TheSlopeofPeakExerciseTextField.text!)// ?? 0.0
            let num_vessels = Double(self.MajorVesselsTextField.text!)// ?? 0.0
            let thallium = Double(self.thalliumTextField.text!)// ?? 0.0
            
            print("age \(age) ")
            print("sex \(sex)")
            print("thallium \(thallium)")
            print("ches \(ches_pain)")
            print(max_hr)
            print(bd)
            print(num_vessels)
            print(cholesterol)
            print(fbs)
            print(exercise_angina)
            print(slope_st)
            print(st_depression)
            print(ekg)
            
            
            guard let prediction = try? self.classifier.prediction(Age: age!, Sex: sex!, Chest_pain_type: ches_pain!, BP: bd! , Cholesterol: cholesterol!, FBS_over_120: fbs!, EKG_results: ekg!, Max_HR: max_hr!, Exercise_angina: exercise_angina!, ST_depression: st_depression!, Slope_of_ST: slope_st!, Number_of_vessels_fluro: num_vessels!, Thallium: thallium!)
            else {
                fatalError("Unexpected runtime error")}
            print(prediction.Heart_DiseaseProbability)
            print(prediction.Heart_Disease)
            
            if prediction.Heart_Disease == "Presence" {
                let alertController = UIAlertController(title: "Warning", message: "It looks like you have some health issues", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
            } else if prediction.Heart_Disease == "Absence" {
                let alertController = UIAlertController(title: "Congrats", message: "Your heart health is okay. Keep it that way", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
        }
        let TestAction = UIAlertAction(title: "Run Test", style: .default, handler: TestActionHandle)
        optionMenu.addAction(TestAction)
        
        //ageTextField.text = ""
    }

    // MARK: - Table view data source
}
//for whent the user finish typing in a textfiel it goes to the next one
extension QuickTestViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder() }
        return true
        
    }
}
