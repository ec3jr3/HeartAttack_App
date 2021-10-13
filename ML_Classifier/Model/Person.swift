//
//  Person.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//


struct ProfileInfo: Hashable {
    var name: String = ""
    var edad: String = ""
    var sexo: String = ""
    var image: String = ""
    
    //for the ml + edad variable
    var pregnancies: String = ""
    var Glucose: String = ""
    var BloodPressure: String = ""
    var SkinThickness: String = ""
    var Insuline: String = ""
    var BMI: String = ""
    var DiabetesPredigreeFunc: String = ""
    
    var Outcome: Bool = false
    
    //var DiabetesResult: Bool = false
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

