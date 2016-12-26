//
//  UILabel+Extension.swift
//  JadeWrench
//
//  Created by mac on 16/10/25.
//  Copyright © 2016年 mac. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setGlobalFont() {
        self.font = UIFont(name: "Hiragino Sans GB W3", size: 17)
    }
    
    // 设置字体（xib或者storyboard）
    @IBInspectable var 设置字体: CGFloat {
        get {
            return self.font.pointSize
        }
        set {
            if isIphone6p {
                self.font = UIFont(name: self.font.fontName, size: newValue * 1.1)
            } else {
                self.font = UIFont(name: self.font.fontName, size: newValue)
            }
        }
    }

}
