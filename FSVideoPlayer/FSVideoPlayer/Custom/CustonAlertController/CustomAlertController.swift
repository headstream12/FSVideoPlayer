//
//  CustomAlertController.swift
//  fschool_ios
//
//  Created by Rinat Yakhin on 05/05/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

protocol CustomAlertProtocol {
    func addAction(action: CustomAlertAction)
}

class BaseAlertController: UIViewController, CustomAlertProtocol {
    func addAction(action: CustomAlertAction) { }
}

class CustomAlertController {
    
    class func create(title: String?, message: String?, preferredStyle: UIAlertControllerStyle) -> BaseAlertController {
        switch preferredStyle {
        case .actionSheet:
            return CustomActionSheetController(title: title)
        case .alert:
            return CustomAlertViewController(title: title, message: message)
        }
    }
}
