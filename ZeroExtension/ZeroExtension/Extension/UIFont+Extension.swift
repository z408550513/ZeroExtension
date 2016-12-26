//
//  UIFont+Extension.swift
//  WuFeng
//
//  Created by 黄杰 on 15/11/4.
//  Copyright © 2015年 黄杰. All rights reserved.
//

import Foundation

enum FontWeight {
    case Light(fontSize: CGFloat)
    case Regular(fontSize: CGFloat)
    case Medium(fontSize: CGFloat)
    case Blod(fontSize: CGFloat)
}

extension UIFont {
    
    class func adaptiveFont(weight: FontWeight) -> UIFont {
        
        var weightString = ""
        var size: CGFloat = 16.0
        
        switch weight {
            
        case .Light(let fontSize):
            weightString = "-Light"
            size = fontSize
            
        case .Regular(let fontSize):
            weightString = ""
            size = fontSize
            
        case .Medium(let fontSize):
            weightString = "-Medium"
            size = fontSize
            
        case .Blod(let fontSize):
            weightString = "-Bold"
            size = fontSize
            
        }
        
        guard let systemFont = UIFont(name: "PingFangSC\(weightString)", size: size) ?? UIFont(name: "STHeitiSC\(weightString)", size: size) else {
            return UIFont.systemFontOfSize(size)
        }
        
        return systemFont
        
    }
    
    // 设置自定义字体（代码）
    convenience init(customFontName: String, size: CGFloat) {
        self.init(name: customFontName, size: (isIphone6p ? size * 1.1 : size))!
    }
    
    // 设置字体大小
    class func setupCustomFontSize(size: CGFloat) -> UIFont {
        return UIFont.systemFontOfSize((isIphone6p ? size * 1.1 : size))
    }
    
    // 设置粗体字体大小
    class func setupCustomBoldFontSize(size: CGFloat) -> UIFont {
        return UIFont.boldSystemFontOfSize((isIphone6p ? size * 1.1 : size))
    }
    
    
}
