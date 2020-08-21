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

import Foundation
import UIKit
//import NVActivityIndicatorView
import CoreLocation


let KAppDelegate = UIApplication.shared.delegate as! AppDelegate

class Proxy {
    static var shared: Proxy {
        return Proxy()
    }
    private init(){}
    //MARK:- Common Methods
    func accessTokenNil() -> String {
        if let accessToken = UserDefaults.standard.object(forKey: AccessToken.token.rawValue) as? String {
            return accessToken
        } else {
            return ""
        }
    }
    func termConditionNil() -> String {
        if let accessToken = UserDefaults.standard.object(forKey: AccessToken.term.rawValue) as? String {
            return accessToken
        } else {
            return ""
        }
    }
    func getLatitude() -> String {
        if UserDefaults.standard.object(forKey: "lat") != nil {
            let currentLat =  UserDefaults.standard.object(forKey: "lat") as! String
            return currentLat
        }
        return ""
    }
    //MARK:- Longitude Method
    func getLongitude() -> String {
        if UserDefaults.standard.object(forKey: "long") != nil {
            let currentLong =  UserDefaults.standard.object(forKey: "long") as! String
            return currentLong
        }
        return ""
    }
    
    func getCurrentAddress() -> String {
        if UserDefaults.standard.object(forKey: "address") != nil {
            let currentLong =  UserDefaults.standard.object(forKey: "address") as! String
            return currentLong
        }
        return ""
    }
    
    //MARK:- Language Selected String For Key
    func languageSelectedStringForKey(key: String) -> String {
        var path = String()
        if let languageStrVal = UserDefaults.standard.object(forKey: "Language") {
            if languageStrVal as! String == "0" {
                path = Bundle.main.path(forResource: "en", ofType: "lproj")!
            } else if languageStrVal as! String == "1" {
                path = Bundle.main.path(forResource:"ar", ofType: "lproj")!
            }
        } else {
            path = Bundle.main.path(forResource:"en", ofType: "lproj")!
        }
        let languageBundle: Bundle = Bundle(path: path)!
        let str: String = languageBundle.localizedString(forKey: key, value: "", table: nil)
        return str
    }
    
    
    //MARK:- Get Device Token
    func deviceToken() -> String {
        var deviceTokken =  ""
        if UserDefaults.standard.object(forKey: "device_token") == nil {
            deviceTokken = "00000000055"
        } else {
            deviceTokken = UserDefaults.standard.object(forKey: "device_token")! as! String
        }
        return deviceTokken
    }
    func getStringFromDict(_ dictionary: NSDictionary) -> String {
        var stringDict =  ""
        if let theJSONData = try?  JSONSerialization.data(
            withJSONObject: dictionary,
            options: .prettyPrinted
            ),
            let theJSONText = String(data: theJSONData,
                                     encoding: String.Encoding.ascii) {
            print("JSON string = \n\(theJSONText)")
            stringDict = theJSONText
        }
        
        return stringDict
    }
    func getDoubleValue(_ value: Any) -> Double {
        
        var finalVal = Double()
        finalVal = 0
        if let  idVal = value as? Double {
            finalVal = idVal
        } else if let  idVal = value as? Int {
            finalVal = Double(idVal)
        } else  if let idVal = value as? String {
            finalVal = Double(idVal)!
        }
        return finalVal
    }
    
    //MARK:- REGISTER NIB FOR TABLE VIEW
    func registerNib(_ tblView: UITableView, identifierCell:String){
        let nib = UINib(nibName: identifierCell, bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: identifierCell)
    }
    
    func registerCollViewNib(_ collView: UICollectionView, identifierCell:String){
        let nib = UINib(nibName: identifierCell, bundle: nil)
        collView.register(nib, forCellWithReuseIdentifier: identifierCell)
    }
    
    func getStringValue(_ value: Any) -> String{
        var finalVal = ""
        if let  idVal   = value as? Int{
            finalVal = "\(idVal)"
        } else if let  idVal   = value as? Double{
            finalVal = "\(idVal)"
        } else if let  idVal   = value as? Float{
            finalVal = "\(idVal)"
        } else  if let idVal = value as? String{
            finalVal = idVal
        }
        return finalVal
    }
    
    func getDate(_ dateVal: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: dateVal)
    }
    func getIntegerValue(_ value: Any) -> Int{
        
        var finalVal = Int()
        finalVal = 0
        if let  idVal   = value as? Int{
            finalVal = idVal
        } else if let  idVal   = value as? Double{
            finalVal = Int(idVal)
        } else  if let idVal = value as? String{
            finalVal = Int(idVal) ?? 0
        }
        return finalVal
    }
    //MARK:- Convert date to string
    func dateConvertDateToString(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MMM"
        let outputDate = formatter.string(from: date)
        return outputDate
    }
    
    func convertDateFormater(_ date: String, selectedDateForrmat:String, needDateFormat: String) -> String  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = selectedDateForrmat
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = needDateFormat
        return  dateFormatter.string(from: date!)
        
    }
    
    func setAlert(_ currentController: UIViewController,titleVal: String, msg: String, actions: [String], completion:@escaping(_ title: String) -> Void){
        
        let alert = UIAlertController(title: titleVal, message: msg, preferredStyle: .alert)
        
        
        // Change font and color of title
        alert.setTitlet(font: UIFont(name: FontName.bold, size: 20), color: .white)
        // Change font and color of message
        alert.setMessage(font: UIFont(name: FontName.regular, size: 15), color:  .white)
        // Change background color of UIAlertController
        alert.setBackgroundColor(color: UIColor.black)
        for action in actions {
            alert.addAction(UIAlertAction(title: action, style: .default, handler: { (alert) in
                completion(action)
            })
            )}
        currentController.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Convert time to string
    func convertTimeToString(time : Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm a"
        let outputTime = timeFormatter.string(from: time)
        return outputTime
    }
    func appendParam(arr : NSMutableArray) -> String {
        return arr.componentsJoined(by: ",")
    }
    
    //MARK: - Add Child Controller
    func addChildView(_ currentController:UIViewController, identifier:String,currentView: UIView) {
        let content = mainStoryboard.instantiateViewController(withIdentifier:identifier)
        currentController.addChild(content)
        content.view.frame = CGRect(x: 0, y: 0, width: currentView.frame.size.width, height: currentView.frame.size.height)
        currentView.addSubview(content.view)
        content.didMove(toParent: currentController)
    }
    //MARK:- Display Toast
    func displayStatusAlert(_ userMessage: String) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            
            sceneDelegate.window!.rootViewController!.view.makeToast(message: userMessage,
                                                                     duration: TimeInterval(4.0),
                                                                     position: .center,
                                                                     title: "",
                                                                     backgroundColor: .black,
                                                                     titleColor: .white,
                                                                     messageColor: .white,
                                                                     font: nil)
            
            // iOS12 or earlier
        } else {
            KAppDelegate.window?.rootViewController?.view.makeToast(message: userMessage,
                                                                    duration: TimeInterval(4.0),
                                                                    position: .center,
                                                                    title: "",
                                                                    backgroundColor: .black,
                                                                    titleColor: .white,
                                                                    messageColor: .white,
                                                                    font: nil)
        }
    }
    
    
    func expiryDateCheckMethod(expiryDate: Int)->Bool  {
     
        let dateInFormat = DateFormatter()
        dateInFormat.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateInFormat.dateFormat = "yyyy-MM-dd"
        let expiryDateConvert = Date(timeIntervalSince1970: TimeInterval(expiryDate))   //dateInFormat.date(from: expiryDate)
        if Date().compare(expiryDateConvert) == .orderedDescending {
            Proxy.shared.displayStatusAlert(TitleMessage.contactWithTeam)
            return false
        }
        return true
    }
    func checkLocationPermission()->Bool  {
    
    let locStatus = CLLocationManager.authorizationStatus()
    switch locStatus {
       case .notDetermined:
        return false
       case .denied, .restricted:
           return false
       case .authorizedAlways, .authorizedWhenInUse:
        return true
     
     default:
        return false
        }
    }
   
    //MARK: - HANDLE ACTIVITY
    func showActivityIndicator() {
        DispatchQueue.main.async
            {
               // let activityData = ActivityData(size: CGSize(width: 50, height: 50), type: .lineScalePulseOut, color: Color.appGrey)
                //NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData,nil)
        }
    }
    func hideActivityIndicator()  {
        DispatchQueue.main.async {
           // NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
            
        }
    }
    
    func openSettingApp() {
        let settingAlert = UIAlertController(title: TitleMessage.connectionProblem, message: TitleMessage.connection, preferredStyle: .alert)
        let okAction = UIAlertAction(title: TitleMessage.cancelSmall, style: .default, handler: nil)
        settingAlert.addAction(okAction)
        let openSetting = UIAlertAction(title: TitleMessage.settings, style: .default, handler:{ (action: UIAlertAction!) in
            let url:URL = URL(string: UIApplication.openSettingsURLString)!
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    (success) in })
            } else {
                guard UIApplication.shared.openURL(url) else {
                    Proxy.shared.displayStatusAlert(AlertMessage.pleaseReviewYourNetworkSettings)
                    return
                }
            }
        })
        settingAlert.addAction(openSetting)
        UIApplication.shared.keyWindow?.rootViewController?.present(settingAlert, animated: true, completion: nil)
    }
}

