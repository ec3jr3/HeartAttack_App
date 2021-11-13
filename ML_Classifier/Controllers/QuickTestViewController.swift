//
//  QuickTestViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 11/5/21.
//

import UIKit

class QuickTestViewController: UITableViewController{
    
    var classifier = HeartPredictionClassifier()
    
    let pickerView = UIPickerView()
    let sexs = ["Male", "Female"]
    var sexforTest = ""
    
    @IBOutlet var ageTextField: UITextField! {
        didSet {
            
            ageTextField.tag = 1
            ageTextField.keyboardType = .decimalPad
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
            thalliumTextField.keyboardType = .decimalPad
            thalliumTextField.delegate = self
        }
    }
    @IBOutlet var ChestPainTextField: RoundedBorderTextField! {
        didSet {
            ChestPainTextField.tag = 4
            ChestPainTextField.keyboardType = .decimalPad
            ChestPainTextField.delegate = self
        }
    }
    @IBOutlet var HeartRateTextField: RoundedBorderTextField! {
        didSet {
            HeartRateTextField.tag = 5
            HeartRateTextField.keyboardType = .decimalPad
            HeartRateTextField.delegate = self
        }
    }
    @IBOutlet var RbloodPressureTextField: RoundedBorderTextField! {
        didSet {
            RbloodPressureTextField.tag = 6
            RbloodPressureTextField.keyboardType = .decimalPad
            RbloodPressureTextField.delegate = self
        }
    }
    @IBOutlet var MajorVesselsTextField: RoundedBorderTextField! {
        didSet {
            MajorVesselsTextField.tag = 7
            MajorVesselsTextField.keyboardType = .decimalPad
            MajorVesselsTextField.delegate = self
        }
    }
    @IBOutlet var CholesterolTextField: RoundedBorderTextField! {
        didSet {
            CholesterolTextField.tag = 8
            CholesterolTextField.keyboardType = .decimalPad
            CholesterolTextField.delegate = self
        }
    }
    @IBOutlet var FastingBloodSugarTextField: RoundedBorderTextField! {
        didSet {
            FastingBloodSugarTextField.tag = 9
            FastingBloodSugarTextField.keyboardType = .decimalPad
            FastingBloodSugarTextField.delegate = self
        }
    }
    @IBOutlet var ExerciseInducedTextField: RoundedBorderTextField! {
        didSet {
            ExerciseInducedTextField.tag = 10
            ExerciseInducedTextField.keyboardType = .decimalPad
            ExerciseInducedTextField.delegate = self
        }
    }
    @IBOutlet var TheSlopeofPeakExerciseTextField: RoundedBorderTextField! {
        didSet {
            TheSlopeofPeakExerciseTextField.tag = 11
            TheSlopeofPeakExerciseTextField.keyboardType = .decimalPad
            TheSlopeofPeakExerciseTextField.delegate = self
        }
    }
    @IBOutlet var StDepressionTextField: RoundedBorderTextField! {
        didSet {
            StDepressionTextField.tag = 12
            StDepressionTextField.keyboardType = .decimalPad
            StDepressionTextField.delegate = self
        }
    }
    @IBOutlet var RestinElectroCardiographicTextField: RoundedBorderTextField! {
        didSet {
            RestinElectroCardiographicTextField.tag = 13
            RestinElectroCardiographicTextField.keyboardType = .decimalPad
            RestinElectroCardiographicTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageTextField.borderStyle = .none
        
        //connecting delegate and datasource
        pickerView.dataSource = self
        pickerView.delegate = self
        
        //when the user types in the sextextField it would popup the pickerView
        sexTextField.inputView = pickerView
        
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
    
    @IBAction func infoThallium(){
        let infoThallium = UIAlertController(title: nil, message: "Thal:                                                                              3 = normal;                                                                    6 = fixed defect;                                                                           7 = reversable defect;", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        infoThallium.addAction(infoAction)
        self.present(infoThallium, animated: true, completion: nil)
    }
    @IBAction func ChestPain(){
        let ChestController = UIAlertController(title: nil, message: "Chest pain type                                                         Value 1: typical angina.                                                  Value 2: atypical angina.                                                   Value 3: non-anginal pain.                                            Value 4: asymptomatic.", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        ChestController.addAction(infoAction)
        self.present(ChestController, animated: true, completion: nil)
    }
    @IBAction func MaxHeartRate() {
        let HeartRateController = UIAlertController(title: nil, message: "Maximum heart rate achieved ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        HeartRateController.addAction(infoAction)
        self.present(HeartRateController, animated: true, completion: nil)
    }
    @IBAction func RestingBlood() {
        let RestingBloodController = UIAlertController(title: nil, message: "Resting blood pressure                                                (in mm Hg on admission to the hospital) ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        RestingBloodController.addAction(infoAction)
        self.present(RestingBloodController, animated: true, completion: nil)
    }
    @IBAction func NumOfMajorVeseels(){
        let MajorVesselsController = UIAlertController(title: nil, message: "Number of major vessels (0-3) colored by flourosopy ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        MajorVesselsController.addAction(infoAction)
        self.present(MajorVesselsController, animated: true, completion: nil)
    }
    @IBAction func Cholesterol(){
        let CholesterolController = UIAlertController(title: nil, message: "Serum cholestoral in mg/dl", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        CholesterolController.addAction(infoAction)
        self.present(CholesterolController, animated: true, completion: nil)
    }
    @IBAction func FastingBloodS(){
        let FastingBloodSController = UIAlertController(title: nil, message: "(Fasting blood sugar > 120 mg/dl)                                                                 (1 = true; 0 = false) ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        FastingBloodSController.addAction(infoAction)
        self.present(FastingBloodSController, animated: true, completion: nil)
    }
    @IBAction func ExerciseInducedA(){
        let ExerciseInducedAController = UIAlertController(title: nil, message: "Exercise induced angina                (1 = yes; 0 = no) ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        ExerciseInducedAController.addAction(infoAction)
        self.present(ExerciseInducedAController, animated: true, completion: nil)
    }
    @IBAction func SlopeOfPeakExercise(){
        let SlopeOfPeakExerciseController = UIAlertController(title: nil, message: "The slope of the peak exercise ST segment.          Value 1: upsloping.                                                                     Value 2: flat.                                                                              Value 3: downsloping ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        SlopeOfPeakExerciseController.addAction(infoAction)
        self.present(SlopeOfPeakExerciseController, animated: true, completion: nil)
    }
    @IBAction func StDepression(){
        let StDepressionController = UIAlertController(title: nil, message: "Oldpeak = ST depression induced by exercise relative to rest ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        StDepressionController.addAction(infoAction)
        self.present(StDepressionController, animated: true, completion: nil)
    }
    @IBAction func RestingECG(){
        let RestingECGController = UIAlertController(title: nil, message: "Resting electrocardiographic results.                                                               Value 0: normal.                                                                            Value 1: having ST-T wave abnormality (T wave inversions and/or ST elevation or depression of > 0.05 mV).                                                                            Value 2: showing probable or definite left ventricular hypertrophy by Estes' criteria ", preferredStyle: .alert)
        let infoAction = UIAlertAction(title: "Thank you", style: .default, handler: nil)
        RestingECGController.addAction(infoAction)
        self.present(RestingECGController, animated: true, completion: nil)
    }
    
    
    //When the user taps in the run test button
    @IBAction func test(){
        
        //alert controller menu
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        present(optionMenu, animated: true, completion: nil)
        
        //cancell action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //run test axction
        let TestActionHandle =  { (action:UIAlertAction!) -> Void in
            
            //converting every single textfiel into a Double varible
            let age = Double(self.ageTextField.text!) //?? 0.00
            let sex = Double(self.sexforTest)
            let ches_pain = Double(self.ChestPainTextField.text!)
            let bd = Double(self.RbloodPressureTextField.text!)
            let cholesterol = Double(self.CholesterolTextField.text!)
            let fbs = Double(self.FastingBloodSugarTextField.text!)
            let ekg = Double(self.RestinElectroCardiographicTextField.text!)
            let max_hr = Double(self.HeartRateTextField.text!)
            let exercise_angina = Double(self.ExerciseInducedTextField.text!)
            let st_depression = Double(self.StDepressionTextField.text!)
            let slope_st = Double(self.TheSlopeofPeakExerciseTextField.text!)
            let num_vessels = Double(self.MajorVesselsTextField.text!)
            let thallium = Double(self.thalliumTextField.text!)
            
            //making sure every single varible is not null
            if age == nil || sex == nil || ches_pain == nil || bd == nil || cholesterol == nil || fbs == nil || ekg == nil || max_hr == nil || exercise_angina == nil || st_depression == nil || slope_st == nil || num_vessels == nil || thallium == nil{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
                
                return
            }
            
            print("age \(age!) ")
            print("sex \(sex!)")
            print("thallium \(thallium!)")
            print("ches \(ches_pain!)")
            print(max_hr!)
            print(bd!)
            print(num_vessels!)
            print(cholesterol!)
            print(fbs!)
            print(exercise_angina!)
            print(slope_st!)
            print(st_depression!)
            print(ekg!)
            
            //Inserting varibles in the MLModel
            guard let prediction = try? self.classifier.prediction(Age: age!, Sex: sex!, Chest_pain_type: ches_pain!, BP: bd! , Cholesterol: cholesterol!, FBS_over_120: fbs!, EKG_results: ekg!, Max_HR: max_hr!, Exercise_angina: exercise_angina!, ST_depression: st_depression!, Slope_of_ST: slope_st!, Number_of_vessels_fluro: num_vessels!, Thallium: thallium!)
            else {
                fatalError("Unexpected runtime error")}
            print(prediction.Heart_DiseaseProbability)
            print(prediction.Heart_Disease)
            
            //Alert for the result
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
            
        }
        let TestAction = UIAlertAction(title: "Run Test", style: .default, handler: TestActionHandle)
        optionMenu.addAction(TestAction)
        
    }
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

// MARK: - UIPickerView Configuration

extension QuickTestViewController:  UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sexs.count
    }

}
extension QuickTestViewController:  UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sexs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sexTextField.text = sexs[row]
        sexforTest = sexTextField.text == "Male" ? "1" : "0"
    }
}

