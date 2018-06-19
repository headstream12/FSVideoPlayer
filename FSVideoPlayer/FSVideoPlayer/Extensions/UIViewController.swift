//
//  UIViewController.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 15/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import UIKit

extension UIViewController {
    func showVariants(title: String, cancelText: String, variants: [(text: String, action: ((CustomAlertAction) ->Void)?)]) {
        let alertVC = CustomAlertController.create(title: title,
                                                   message: nil,
                                                   preferredStyle: .actionSheet)
        for variant in variants {
            let action = CustomAlertAction(title: variant.text, style: .default, handler: variant.action)
            alertVC.addAction(action: action)
        }
        alertVC.addAction(action: CustomAlertAction(title: cancelText, style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
