
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
            if iphone6p {
                self.font = UIFont(name: self.font.fontName, size: newValue * 1.1)
            } else {
                self.font = UIFont(name: self.font.fontName, size: newValue)
            }
        }
    }

}
