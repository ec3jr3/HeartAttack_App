//
//  Person.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//


struct ProfileInfo: Hashable {
    //hello mundo
    var name: String = ""
    var image: String = ""
    var edad: String = ""
    
    //for the ml + edad variable
    var sexo: String = ""
    var chest_pain_type: String = ""
    var bp: String = ""
    var cholesterol: String = ""
    var fbs_over_120: String = ""
    var ekg_results : String = ""
    var max_hr: String = ""
    var exercise_angina: String = ""
    var st_depressionL: String = ""
    var slope_of_st: String = ""
    var number_of_vessels_fluro: String = ""
    var thallium: String = ""
    
    var Outcome: Bool = false
    var DiabetesResult: String = ""
}
/*import CoreData

public class PersonIn: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonIn>{
        return NSFetchRequest<PersonIn>(entityName: "Person")
    }
    @NSManaged public var name: String
    @NSManaged public var age: String
    @NSManaged public var Sexo: String
    @NSManaged public var Pregnancies: String
    @NSManaged public var Glucose: String
    @NSManaged public var BloodPressure: String
    @NSManaged public var SkinThickness: String
    @NSManaged public var Insuline: String
    @NSManaged public var BMI: String
    @NSManaged public var DiabetesPredigreeFunc: String
    @NSManaged public var Outcome: String
    @NSManaged public var Image: Data
}*/

