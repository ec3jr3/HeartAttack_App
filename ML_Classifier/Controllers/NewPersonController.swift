//
//  NewPersonController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 10/1/21.
//

import UIKit
import CoreData

class NewPersonController: UITableViewController {
    
    var personEdit: ProfileInfo = ProfileInfo()
    //var person: PersonIn!
    
    
    
    @IBOutlet var nameTextField: RoundedBorderTextField! {
        didSet {
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
    } }
    @IBOutlet var ageTextField: RoundedBorderTextField! {
        didSet {
            ageTextField.tag = 2
            ageTextField.keyboardType = .asciiCapableNumberPad
            ageTextField.delegate = self
        }
    }
    @IBOutlet var sexTextField: RoundedBorderTextField! {
        didSet {
            sexTextField.tag = 3
            sexTextField.delegate = self
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
    @IBOutlet var photoImageView: UIImageView! {
        didSet {
            photoImageView.layer.cornerRadius = 10.0
            photoImageView.layer.masksToBounds = true
            
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
        
        // Get the superview's layout
        let margins = photoImageView.superview!.layoutMarginsGuide
        
        // Disable auto resizing mask to use auto layout programmatically
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Pin the leading edge of the image view to the margin's leading edge
        photoImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        
        // Pin the trailing edge of the image view to the margin's leading edge
        photoImageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        // Pin the top edge of the image view to the margin's leading edge
        photoImageView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        
        // Pin the bottom edge of the image view to the margin's leading edge
        photoImageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true

        // Dismiss keyboard when users tap any blank area of the view
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    public var completitionHandler: ((String?) -> Void)?
    // MARK: - Button Actions
    
    @IBAction func saveButtonTapped(sender: UIButton) {
        if nameTextField.text == "" || ageTextField.text == "" || sexTextField.text == "" || ChestPainTextField.text == "" || HeartRateTextField.text == "" || RbloodPressureTextField.text == "" || MajorVesselsTextField.text == "" || CholesterolTextField.text == "" || FastingBloodSugarTextField.text == "" || ExerciseInducedTextField.text == "" || TheSlopeofPeakExerciseTextField.text == "" || StDepressionTextField.text == "" || RestinElectroCardiographicTextField.text == "" {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because one of the fields is blank. Please note that all fields are required.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
            return
        }
        
        print("Name: \(nameTextField.text ?? "")")
        print("Age: \(ageTextField.text ?? "")")
        print("Sex: \(sexTextField.text ?? "")")
        print("Name: \(ChestPainTextField.text ?? "")")
        print("Name: \(HeartRateTextField.text ?? "")")
        print("# OF Pregnancies: \(RbloodPressureTextField.text ?? "")")
        print("Glucose: \(MajorVesselsTextField.text ?? "")")
        print("Blood : \(CholesterolTextField.text ?? "")")
        print("Skin Thickness: \(FastingBloodSugarTextField.text ?? "")")
        print("Insuline levels: \(ExerciseInducedTextField.text ?? "")")
        print("BMI: \(TheSlopeofPeakExerciseTextField.text ?? "")")
        print("Diabetes Func: \(StDepressionTextField.text ?? "")")
        print("Diabetes Func: \(RestinElectroCardiographicTextField.text ?? "")")
        
        /*if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            person = PersonIn(context: appDelegate.persistentContainer.viewContext)
            person.name = nameTextField.text!
            person.age = ageTextField.text!
            person.Pregnancies = preganTextField.text!
            person.Glucose = glucoseTextField.text!
            person.BloodPressure = bloodTextField.text!
            person.SkinThickness = skinthicTextField.text!
            person.Insuline = InsulineTextField.text!
            person.BMI = BMITextField.text!
            person.DiabetesPredigreeFunc = FuncTextField.text!
            
            if let imageData = photoImageView.image?.pngData() {
                person.Image = imageData
            }
            print("Saving data to context...")
            appDelegate.saveContext()
        }*/
        
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {

            let photoSourceRequestController = UIAlertController(title: "", message: "Choose your photo source", preferredStyle: .actionSheet)

            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            })

            let photoLibraryAction = UIAlertAction(title: "Photo library", style: .default, handler: { (action) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    imagePicker.delegate = self
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            })

            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)

            // For iPad
            if let popoverController = photoSourceRequestController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }

            present(photoSourceRequestController, animated: true, completion: nil)

        }
    }
}
//for whent the user finish typing in a textfiel it goes to the next one
extension NewPersonController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder() }
        return true
        
    }
}

extension NewPersonController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }

        dismiss(animated: true, completion: nil)
    }
    
}
