//
//  UIAplication.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 15/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
