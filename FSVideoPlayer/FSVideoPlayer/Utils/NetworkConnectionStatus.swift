//
//  NetworkConnectionStatus.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 19/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import Foundation
import CoreTelephony
import Reachability

struct NetworkConnectionStatus {
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
        
        enum ConnectionType {
            case wwan2g
            case wwan3g
            case wwan4g
            case wifi
            case noConnection
            case unknown
        }
        
        var description: ConnectionType {
            switch self {
            case .gprs, .edge, .cdma:
                return .wwan2g
            case .lte:
                return .wwan4g
            default:
                return .wwan3g
            }
        }
    }
    
    static func getCurrentConnectionType() -> RadioAccessTechnology.ConnectionType {
        
        let reachability = Reachability()
        let connection = reachability?.connection
        if connection == .wifi {
            return .wifi
        }
        
        let networkInfo = CTTelephonyNetworkInfo()
        let network = networkInfo.currentRadioAccessTechnology
        guard let networkString = network else {
            return .noConnection
        }
        let tecnology = RadioAccessTechnology(rawValue: networkString)
       
        return tecnology!.description
    }
}


