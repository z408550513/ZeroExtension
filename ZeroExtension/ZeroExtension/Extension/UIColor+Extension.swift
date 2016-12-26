



import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        let cleanedHexString = hexString
        
        // String -> UInt32
        var rgbValue: UInt32 = 0
        NSScanner(string: cleanedHexString).scanHexInt(&rgbValue)
        
        // UInt32 -> R,G,B
        let red = CGFloat((rgbValue >> 16) & 0xff) / 255.0
        let green = CGFloat((rgbValue >> 08) & 0xff) / 255.0
        let blue = CGFloat((rgbValue >> 00) & 0xff) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // 导航栏
    class func StyleColor() -> UIColor {
        
        
        return UIColor.init(hexString: "179527")
    
    }
    //背景
    class func BackgroundColor() -> UIColor {
        
        
        return UIColor.init(hexString: "ECEDF1")
        
    }
    
}
