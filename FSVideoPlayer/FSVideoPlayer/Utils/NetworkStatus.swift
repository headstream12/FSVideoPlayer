//
//  NetworkStatus.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 19/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import Foundation
import CoreTelephony

struct NetworkStatus {
    enum RadioAccessTechnology: String {
        case cdma = "CTRadioAccessTechnologyCDMA1x"
        case edge = "CTRadioAccessTechnologyEdge"
        case gprs = "CTRadioAccessTechnologyGPRS"
        case hrpd = "CTRadioAccessTechnologyeHRPD"
        case hsdpa = "CTRadioAccessTechnologyHSDPA"
        case hsupa = "CTRadioAccessTechnologyHSUPA"
        case lte = "CTRadioAccessTechnologyLTE"
        case rev0 = "CTRadioAccessTechnologyCDMAEVDORev0"
        case revA = "CTRadioAccessTechnologyCDMAEVDORevA"
        case revB = "CTRadioAccessTechnologyCDMAEVDORevB"
        case wcdma = "CTRadioAccessTechnologyWCDMA"
        
        var description: String {
            switch self {
            case .gprs, .edge, .cdma:
                return "2G"
            case .lte:
                return "4G"
            default:
                return "3G"
            }
        }
    }
    
    static func getCurrentConnectionType() -> String {
        let networkInfo = CTTelephonyNetworkInfo()
        let network = networkInfo.currentRadioAccessTechnology
        guard let networkString = network else {
            return "none"
        }
        let tecnology = RadioAccessTechnology(rawValue: networkString)
       
        print("Вы сидите через \(tecnology!.description)")
        return tecnology!.description
    }
}


