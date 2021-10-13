//
//  TestViewController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/28/21.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet var headerImageView: MLHeaderview!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        headerImageView.ModelImageView.image = UIImage(named: "model")
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
