






import UIKit
import Foundation



// 判断IPHONE
let iphone6_Up : Bool = UIScreen.mainScreen().bounds.size.height > 568
let iphone5 : Bool = UIScreen.mainScreen().bounds.size.height == 568
let iphone4_Down : Bool = UIScreen.mainScreen().bounds.size.height < 568
let iphone6 : Bool = UIScreen.mainScreen().bounds.size.height == 667
let iphone6p : Bool = UIScreen.mainScreen().bounds.size.height == 736
