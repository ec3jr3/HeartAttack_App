//
//  NavigationController.swift
//  ML_Classifier
//
//  Created by Andres Castellanos on 9/30/21.
//

import UIKit

class NavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return topViewController?.preferredStatusBarStyle ?? .default
    }

}
