//
//  UIColor.swift
//  FSVideoPlayer
//
//  Created by Ilya Glazunov on 15/06/2018.
//  Copyright © 2018 IG. All rights reserved.
//

import UIKit

extension UIColor {
    
    enum appearances {
        
        static var tabBarColor: UIColor {
            return #colorLiteral(red: 0.2392156863, green: 0.2, blue: 0.2941176471, alpha: 1)
        }
        static var navigationBarColor: UIColor {
            return #colorLiteral(red: 0.1490196078, green: 0.1294117647, blue: 0.1725490196, alpha: 1)
        }
    }
    
    enum base {
        
        static var gray: UIColor {
            return #colorLiteral(red: 0.4901960784, green: 0.4901960784, blue: 0.4901960784, alpha: 1)
        }
        
        // TODO: Обернуть в enum и заголовок где используется
        static var macaroniAndCheese: UIColor {
            return #colorLiteral(red: 0.9333333333, green: 0.7058823529, blue: 0.2156862745, alpha: 1)
        }
        
        static var macaroniAndCheeseDisabled: UIColor {
            return #colorLiteral(red: 0.5294117647, green: 0.4078431373, blue: 0.2, alpha: 1)
        }
    }
    
    enum Guides {
        
        static var white05: UIColor {
            return #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.05)
        }
        
        static var white30: UIColor {
            return #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.3)
        }
        
        static var macaroniAndCheese: UIColor {
            return #colorLiteral(red: 0.9333333333, green: 0.7058823529, blue: 0.2156862745, alpha: 1)
        }
        
        static var dark: UIColor {
            return #colorLiteral(red: 0.1490196078, green: 0.1294117647, blue: 0.1725490196, alpha: 1)
        }
        
        static var selectedCell: UIColor {
            return #colorLiteral(red: 0.2392156863, green: 0.2, blue: 0.2941176471, alpha: 1)
        }
        
        // Бэкраунд основного контента
        static var darkTwo: UIColor {
            return #colorLiteral(red: 0.1137254902, green: 0.1058823529, blue: 0.1294117647, alpha: 1)
        }
    }
    
    enum Lessons {
        static var seafoam: UIColor {
            return #colorLiteral(red: 0.09019607843, green: 0.7333333333, blue: 0.5568627451, alpha: 1)
        }
        
        static var indigoTwo: UIColor {
            return #colorLiteral(red: 0.231372549, green: 0.05490196078, blue: 0.4352941176, alpha: 1)
        }
        
        // Бэкраунд основного контента
        static var darkTwo: UIColor {
            return #colorLiteral(red: 0.1137254902, green: 0.1058823529, blue: 0.1294117647, alpha: 1)
        }
        
        static var tealish: UIColor {
            return #colorLiteral(red: 0.1294117647, green: 0.8431372549, blue: 0.6901960784, alpha: 1)
        }
        
        static var darkFour: UIColor {
            return #colorLiteral(red: 0.2156862745, green: 0.1882352941, blue: 0.2509803922, alpha: 1)
        }
        
        static var darkSix: UIColor {
            return #colorLiteral(red: 0.2117647059, green: 0.1843137255, blue: 0.2470588235, alpha: 1)
        }
        
        static var dark: UIColor {
            return #colorLiteral(red: 0.1490196078, green: 0.1294117647, blue: 0.1725490196, alpha: 1)
        }
    }
    
    enum CoachStaff {
        
        static var darkHistory: UIColor {
            return #colorLiteral(red: 0.2392156863, green: 0.2, blue: 0.2941176471, alpha: 1)
        }
        
        static var dark: UIColor {
            return #colorLiteral(red: 0.1490196078, green: 0.1294117647, blue: 0.1725490196, alpha: 1)
        }
        
        static var white10: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1)
        }
        
        static var subtitle: UIColor {
            return #colorLiteral(red: 0.7490196078, green: 0.7490196078, blue: 0.7490196078, alpha: 0.1)
        }
        
        static var sendButtonTitle: UIColor {
            return #colorLiteral(red: 0.09803921569, green: 0.08235294118, blue: 0.1176470588, alpha: 1)
        }
    }
    
    enum Chat {
        static var dark: UIColor {
            return #colorLiteral(red: 0.1490196078, green: 0.1294117647, blue: 0.1725490196, alpha: 1)
        }
        
        static var darkTwo: UIColor {
            return #colorLiteral(red: 0.1137254902, green: 0.1058823529, blue: 0.1294117647, alpha: 1)
        }
        
        static var white80: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        }
        
        static var outgoingBubble: UIColor {
            return #colorLiteral(red: 0.2156862745, green: 0.1882352941, blue: 0.2509803922, alpha: 1)
        }
        
        static var incomingBubble: UIColor {
            return #colorLiteral(red: 0.262745098, green: 0.2078431373, blue: 0.337254902, alpha: 1)
        }
        
        static var inputView: UIColor {
            return #colorLiteral(red: 0.2156862745, green: 0.1882352941, blue: 0.2509803922, alpha: 1)
        }
    }
    
    enum AlertView {
        
        static var tintColor: UIColor {
            return #colorLiteral(red: 0.2392156863, green: 0.2156862745, blue: 0.2941176471, alpha: 1)
        }
        
        static var textColor: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        static var separatorLine: UIColor {
            return #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.05)
        }
        
        static var buttonTitle: UIColor {
            return #colorLiteral(red: 0.9333333333, green: 0.7058823529, blue: 0.2156862745, alpha: 1)
        }
        
        static var background: UIColor {
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        }
    }
    
    enum Profile {
        
        static var progressView: UIColor {
            return #colorLiteral(red: 0.2352941176, green: 0.1529411765, blue: 0.3215686275, alpha: 1)
        }
        
        static var rankLabel: UIColor {
            return #colorLiteral(red: 0.5843137255, green: 0.3803921569, blue: 0.737254902, alpha: 1)
        }
        
        static var headerViewBackground: UIColor {
            return #colorLiteral(red: 0.1294117647, green: 0.1254901961, blue: 0.1843137255, alpha: 1)
        }
        
        static var backgroundColor: UIColor {
            return #colorLiteral(red: 0.1294117647, green: 0.1137254902, blue: 0.1450980392, alpha: 1)
        }
        
        static var backgroundCell: UIColor {
            return #colorLiteral(red: 0.2156862745, green: 0.1882352941, blue: 0.2509803922, alpha: 1)
        }
        
        static var timeTitle: UIColor {
            return #colorLiteral(red: 0.9333333333, green: 0.7058823529, blue: 0.2156862745, alpha: 1)
        }
        
        static var progressViewGradientStart: UIColor {
            return #colorLiteral(red: 0.9254901961, green: 0.6941176471, blue: 0.2196078431, alpha: 1)
        }
        
        static var progressViewGradientEnd: UIColor {
            return #colorLiteral(red: 0.831372549, green: 0.1882352941, blue: 0.4588235294, alpha: 1)
        }
        
        static var whiteTitle: UIColor {
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
        }
        
    }
    
}
