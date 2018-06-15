//
//  UINavigationBar.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 15/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func setNavigationBarTransluent() {
        self.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
        self.barTintColor = .clear
        self.backgroundColor = .clear
    }
}
