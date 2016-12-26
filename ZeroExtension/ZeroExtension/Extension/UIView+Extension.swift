//
//  UIView+Extension.swift
//  JYB
//
//  Created by 黄杰 on 15/10/20.
//  Copyright © 2015年 黄杰. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    @IBInspectable var 设置圆角: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var 边框线条宽度: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var 边框线条颜色: UIColor {
        get {
            return UIColor(CGColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.CGColor
        }
    }
    
    @IBInspectable var 虚线: Bool {
        get {
            return true
        }
        set {
            if newValue == true {
                
                self.setDottedLine(self.backgroundColor, rect: CGRectMake(0, 0, 1000, 1000), spacing: 1, width: 3)
                self.backgroundColor = UIColor.clearColor()
            }else {
            
                self.removeDottedLine()
            }
        }
    }
    
    
    /**
     设置虚线
     
     - parameter color:   虚线颜色
     - parameter rect:    虚线位置
     - parameter spacing: 间隙大小
     - parameter width:   线条宽度
     */
    func setDottedLine(color: UIColor!, rect: CGRect, spacing: Int, width: Int) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = rect
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.strokeColor = color.CGColor
        shapeLayer.lineWidth = rect.size.height
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [(width), (spacing)]
        let path = CGPathCreateMutable()
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, rect.size.width, 0)
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
        self.layer.masksToBounds = true
    }

    
    func removeDottedLine() {
        if self.layer.sublayers == nil { return }
        for index in self.layer.sublayers! {
            
            index.removeFromSuperlayer()
        
        
        }
    
    }
}
