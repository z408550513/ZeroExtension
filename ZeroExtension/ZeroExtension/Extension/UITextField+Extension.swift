//
//  UITextField+Extension.swift
//  JadeWrench
//
//  Created by 黄杰 on 2016/11/30.
//  Copyright © 2016年 mac. All rights reserved.
//

import Foundation

extension UITextField {
    // 设置字体（xib或者storyboard）
    @IBInspectable var 设置字体: CGFloat {
        get {
            return self.font!.pointSize
        }
        set {
            if isIphone6p {
                self.font = UIFont(name: self.font!.fontName, size: newValue * 1.1)
            } else {
                self.font = UIFont(name: self.font!.fontName, size: newValue)
            }
        }
    }
}
