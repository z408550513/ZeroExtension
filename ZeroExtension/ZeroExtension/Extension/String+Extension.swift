//
//  NSString+Extension.swift
//  MYLY
//
//  Created by 黄杰 on 15/9/11.
//  Copyright © 2015年 &#40644;&#26480;. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    /**
     将时间戳转换成时间
     
     - parameter timestamp: 时间戳
     - parameter formatter: 时间格式
     */
    static func stringFromTimestamp(timestamp: String?, withFormatter formatter: String?) -> String? {
        guard let stamp = timestamp, fm = formatter else { return nil }
        let nsStamp = NSString(string: stamp)
        let date = NSDate(timeIntervalSince1970: nsStamp.doubleValue)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = fm
        return dateFormatter.stringFromDate(date)
    }
    
    /**
     将时间转换成字符串
     
     - parameter date:      <#date description#>
     - parameter formatter: <#formatter description#>
     
     - returns: <#return value description#>
     */
    static func stringFromDate(date: NSDate?, withFormatter formatter: String?) -> String? {
        guard let timeDate = date, fm = formatter else { return nil }
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = fm
        return dateFormatter.stringFromDate(timeDate)
    }
    
    /**
     手机号验证
     
     - parameter mobile: 手机号
     
     - returns: true/fales 符合条件,不符合条件
     */
    static func isValidateMobile(mobile: String?) -> Bool {
        let phoneRegex = "^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if mobile != nil {
            return phoneTest.evaluateWithObject(mobile)
        } else {
            return false
        }
    }
    
    /**
     四舍五入
     
     - parameter price:    要四舍五入的值
     - parameter position: 保留多少小数位
     
     - returns: 返回四舍五入后的值
     */
    static func notRounding(price: Float, afterPoint position: Int16) -> NSString? {
        let roundingBehavior = NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundUp, scale: position, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        var ouncesDecimal: NSDecimalNumber
        var roundedOunces: NSDecimalNumber
        
        ouncesDecimal = NSDecimalNumber(float: price)
        roundedOunces = ouncesDecimal.decimalNumberByRoundingAccordingToBehavior(roundingBehavior)
        
        return roundedOunces.stringValue
    }
    
    /**
     获取当前星期几
     
     - parameter date: 传入的时间
     
     - returns: 返回当前为星期几元祖
     */
    static func getCurrentWeekDay(date: NSDate) -> (String, Int)? {
        let arrWeek = ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
        let date = NSDate()
        
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let timeZone = NSTimeZone(name: "Asia/Shanghai")
        calendar!.timeZone = timeZone!
        var comps = NSDateComponents()
        comps = calendar!.components(NSCalendarUnit.Weekday, fromDate: date)
        let week = comps.weekday
        return (arrWeek[week - 1], week - 1)
    }
    
    /**
     本地化字符串
     
     - parameter tableName: 文件名称
     - parameter comment:   注释名称
     
     - returns: 本地化后的字符串
     */
    func localizedWithComment(tableName: String?, comment: String?) -> String {
        
        guard let commentStr = comment else {
            return NSLocalizedString(self, tableName: tableName!, bundle: NSBundle.mainBundle(), value: "", comment: "")
        }
        
        return NSLocalizedString(self, tableName: tableName!, bundle: NSBundle.mainBundle(), value: "", comment: commentStr)
    }
    
    /**
     本地化字符串
     
     - parameter tableName: 文件名称
     
     - returns: 本地化后的字符串
     */
    func localizedWithComment(tableName: String?) -> String {
        return NSLocalizedString(self, tableName: tableName!, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    // 对应默认的Localizable.strings
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    /**
     浮点数相乘
     */
    static func decimalNumberMutiplyWithString(multiplierValue: String, andOtherString otherString: String) -> String {
        let multiplierNumber = NSDecimalNumber(string: multiplierValue)
        let multiplicandNumber = NSDecimalNumber(string: otherString)
        let product = multiplicandNumber.decimalNumberByMultiplyingBy(multiplierNumber)
        return product.stringValue
    }
    
    /**
     浮点数相加
     */
    static func decimalNumberByAdding(multiplierValue: String, andOtherString otherString: String) -> String {
        let multiplierNumber = NSDecimalNumber(string: multiplierValue)
        let multiplicandNumber = NSDecimalNumber(string: otherString)
        let product = multiplicandNumber.decimalNumberByAdding(multiplierNumber)
        return product.stringValue
    }
    
    /**
     浮点数相减
     */
    static func decimalNumberBySubtracting(multiplierValue: String, andOtherString otherString: String) -> String {
        let multiplierNumber = NSDecimalNumber(string: multiplierValue)
        let multiplicandNumber = NSDecimalNumber(string: otherString)
        let product = multiplierNumber.decimalNumberBySubtracting(multiplicandNumber)
        return product.stringValue
    }
    
    /**
     过滤空格
     */
    static func trimmingCharactersWhite(str: String) -> String {
        // 去除两端空格
        let temp = str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        // 去除其余空格
        let text = temp.stringByReplacingOccurrencesOfString(" ", withString: "")
        return text
    }
    
    //正则, 判断字符串是否有 字母 和 数字
    static func checkIsHaveNumAndLetter(psw : String) -> Int {
        //数字条件
        var tNumMatchCount : Int = 0
        if let tNumRegularExPression = try? NSRegularExpression(pattern: "[0-9]", options: NSRegularExpressionOptions.CaseInsensitive) {
            
            tNumMatchCount = tNumRegularExPression.numberOfMatchesInString(psw, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, psw.characters.count))
        }
        //字母条件
        var tLetterMatchCount : Int = 0
        if let tLetterRegularExPression = try? NSRegularExpression(pattern: "[A-Za-z]", options: NSRegularExpressionOptions.CaseInsensitive){
            
            tLetterMatchCount = tLetterRegularExPression.numberOfMatchesInString(psw, options: NSMatchingOptions.ReportProgress, range: NSMakeRange(0, psw.characters.count))
        }
        if tNumMatchCount == psw.characters.count {
            //全部符合数字，表示沒有英文
            return 1;
        } else if tLetterMatchCount == psw.characters.count {
            //全部符合英文，表示沒有数字
            return 2;
        } else if tNumMatchCount + tLetterMatchCount == psw.characters.count {
            //符合英文和符合数字条件的相加等于密码长度
            return 3;
        } else {
            return 4;
            //可能包含标点符号的情況，或是包含非英文的文字，这里再依照需求详细判断想呈现的错误
        }
        
    }
    
    static func 获取地区名称首字母 (地区名称 : String) -> String{
        let str = NSMutableString(string: 地区名称)
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformMandarinLatin, false)
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformStripDiacritics, false)
        
//        let big = str.capitalizedString
        
        return (str as NSString ).substringToIndex(1)
    }
    static func 获取地区名称拼音 (地区名称 : String) -> String{
        let str = NSMutableString(string: 地区名称)
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformToLatin, false)
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformStripDiacritics, false)
        
        
        
        
        return str.stringByReplacingOccurrencesOfString(" ", withString: "")
    }
    
}

func ImageUrlStringCheck(url : String ) -> String{
    
    
    if url.hasPrefix("http://") {
        
        return url
    }
    return appApi + url
    
    
}
