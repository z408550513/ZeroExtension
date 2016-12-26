




import UIKit
import Foundation
//import SDWebImage




public enum GradientType : UInt {
    case TopBottom // 从上到下
    case LeftRight // 从左到右
    case UpLeftLowRight // 左上到右下
    case UpRightLowLeft // 右上到左下
}

extension UIButton {
    
    
    
    /**
     开启非wifi状态下关闭下载图片
     */
    func pts_setImageWithURL(url: String?, forState state: UIControlState, withplaceHolderImage placeHolderImage: UIImage?) {
        guard let urlStr = url else {
            return
        }
        let switchOpen = NSUserDefaults.standardUserDefaults().boolForKey("switchOpen")
        if switchOpen { // 如果开关打开
            
            let wifiOpen = NSUserDefaults.standardUserDefaults().boolForKey("IsWifiOpen")
            if wifiOpen {
                self.sd_setImageWithURL(NSURL(string: urlStr), forState: state, placeholderImage: placeHolderImage)
            } else {
                if let placeImage = placeHolderImage {
                    self.setImage(placeImage, forState: state)
                } else {
                    self.setImage(UIImage(named: "header_defult"), forState: state)
                }
            }
            
        } else { // 如果开关关闭
            self.sd_setImageWithURL(NSURL(string: urlStr), forState: state, placeholderImage: placeHolderImage)
        }
    }
    
    /**
     开启非wifi状态下关闭下载背景图片
     */
    func pts_setBackgroundImageWithURL(url: String?, forState state: UIControlState, withplaceHolderImage placeHolderImage: UIImage?) {
        guard let urlStr = url else {
            return
        }
        let switchOpen = NSUserDefaults.standardUserDefaults().boolForKey("switchOpen")
        if switchOpen { // 如果开关打开
            
            let wifiOpen = NSUserDefaults.standardUserDefaults().boolForKey("IsWifiOpen")
            if wifiOpen {
                self.sd_setBackgroundImageWithURL(NSURL(string: urlStr), forState: state, placeholderImage: placeHolderImage)
            } else {
                if let placeImage = placeHolderImage {
                    self.setImage(placeImage, forState: state)
                } else {
                    self.setImage(UIImage(named: "header_defult"), forState: state)
                }
            }
            
        } else { // 如果开关关闭
            self.sd_setBackgroundImageWithURL(NSURL(string: urlStr), forState: state, placeholderImage: placeHolderImage)
        }
    }
    
    // 设置字体（xib或者storyboard）
    @IBInspectable var 设置字体: CGFloat {
        get {
            return (self.titleLabel?.font.pointSize)!
        }
        set {
            if Iphone6p {
                self.titleLabel?.font = UIFont(name: (self.titleLabel?.font.fontName)!, size: newValue * 1.1)
            } else {
                self.titleLabel?.font = UIFont(name: (self.titleLabel?.font.fontName)!, size: newValue)
            }
        }
    }
    
}
