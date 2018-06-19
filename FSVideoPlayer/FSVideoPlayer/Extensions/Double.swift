//
//  Double.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 19/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import Foundation

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
