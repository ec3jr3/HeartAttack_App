//
//  Person.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//


struct ProfileInfo: Hashable {

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
    var HeartResult: String = ""
}
/*import CoreData

public class ProfileInfo: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProfileInfo>{
        return NSFetchRequest<ProfileInfo>(entityName: "Person")
    }
    @NSManaged public var name: String
    @NSManaged public var image: Data
    @NSManaged public var edad: String
    
    @NSManaged public var sexo: String
    @NSManaged public var chest_pain_type: String
    @NSManaged public var bp: String
    @NSManaged public var cholesterol: String
    @NSManaged public var fbs_over_120: String
    @NSManaged public var ekg_results: String
    @NSManaged public var max_hr: String
    @NSManaged public var exercise_angina: String
    @NSManaged public var st_depressionL: String
    @NSManaged public var slope_of_st: String
    @NSManaged public var number_of_vessels_fluro: String
    @NSManaged public var thallium: String
    
    @NSManaged public var Outcome: String
    @NSManaged public var HeartResult: String
    
    
    
}*/

