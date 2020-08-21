/**
 *
 *@copyright : ToXSL Technologies Pvt. Ltd. < www.toxsl.com >
 *@author     : Shiv Charan Panjeta < shiv@toxsl.com >
 *
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of ToXSL Technologies Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 */


import UIKit

enum AppInfo {
    static let mode = "development"
    static let appName = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
    static let version =  Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    static let userAgent = "\(mode)/\(appName)/\(version)"
}

enum DeviceInfo{
    static let deviceType =  "2"
    static let deviceName =  UIDevice.current.name
}

enum FontName {
    static let bold = "SF-UI-Text-Bold"
    static let regular = "SF-UI-Text-Bold"
}

enum AccessToken : String {
    case token = "access-token"
     case term = "term-condition"
}


var dollerCurrency: String{
    return "$"
}
enum Color {
    static let dustyOrange = UIColor(red: 236/255, green: 132/255, blue: 54/255, alpha: 1)
    static let lightGreyText = UIColor(red: 226/255, green:232/255, blue: 238/255, alpha: 1)
    static let darkGreyText = UIColor(red: 151/255, green:151/255, blue: 151/255, alpha: 1)
}

var mainStoryboard: UIStoryboard{
    return UIStoryboard(name:"Main",bundle: Bundle.main)
}


struct ApiResponse {
    var jsonData: Data?
    var data: NSDictionary?
    var message: String?
}

enum Gender: Int {
    case male = 0, female
}

enum PersonalityQuestion: Int {
    case gender = 0, feelings, organized
}

enum PreferenceQuestion: Int {
    case entertainment = 0, sports, weather, yourself, hobbies
}

enum Apis{
   static let serverUrl =  "http://node.toxsl.in:3005/"
    
}


