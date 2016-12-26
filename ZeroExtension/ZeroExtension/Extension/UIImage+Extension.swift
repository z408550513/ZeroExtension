

import Foundation
import UIKit

extension UIImage {
    /**
    *  返回拉伸后的图片
    */
    class func resizeWithImageNameSwift(imageName: String?) -> UIImage? {
        return resizeWithImageNameSwift(imageName!, left: 0.5, top: 0.5)
    }
    
    /**
    *  返回一张自由拉伸图片
    */
    class func resizeWithImageNameSwift(imageName: String?, left: Float, top: Float) -> UIImage? {
        let image: UIImage = UIImage(named: imageName!)!
        return image.stretchableImageWithLeftCapWidth(Int(Float(image.size.width) * left), topCapHeight: Int(Float(image.size.height) * top))
    }
    
    /**
     返回一张指定尺寸的图片
     
     - parameter size: 目标大小
     
     - returns: 返回一张指定尺寸的图片
     */
    func scaleToSize(img: UIImage,size: CGSize) -> UIImage? {
        // 创建一个bitmap的context
        // 并把它设置成为当前正在使用的context
        //Determine whether the screen is retina
        if UIScreen.mainScreen().scale == 2.0 {
            UIGraphicsBeginImageContextWithOptions(size, false, 2.0)
        } else {
            UIGraphicsBeginImageContext(size)
        }
        // 绘制改变大小的图片
        img.drawInRect(CGRectMake(0, 0, size.width, size.height))
        // 从当前context中创建一个改变大小后的图片
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        // 使当前的context出堆栈
        UIGraphicsEndImageContext()
        // 返回新的改变大小后的图片
        return scaledImage
    }
    
    
    class func createImage(color : UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context : CGContextRef = UIGraphicsGetCurrentContext()!
        
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
        
    }
    
}
