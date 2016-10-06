//
//  ViewControllerHelper.swift
//  PWEnumViews
//
//  Created by Gabriel Morales on 8/23/16.
//  Copyright © 2016 Gabemdev. All rights reserved.
//

import UIKit

extension UIViewController {
    var contentViewController: UIViewController {
        if let navController = self as? UINavigationController {
            return navController.visibleViewController!
        } else {
            return self
        }
    }
}
