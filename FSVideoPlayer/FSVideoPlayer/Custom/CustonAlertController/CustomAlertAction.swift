//
//  CustomAlertAction.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 11/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

final class CustomAlertAction {
    
    let title: String
    let style: UIAlertActionStyle
    var handler: ((CustomAlertAction) -> Void)?
    
    init(title: String, style: UIAlertActionStyle, handler: ((CustomAlertAction) -> Void)?) {
        self.title = title
        self.style = style
        self.handler = handler
    }
}
