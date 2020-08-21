//
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

class PreferencesVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwPreferences: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblHeightCnst: NSLayoutConstraint!
    
    //MARK:- Object
    var objPreferencesVM = PreferencesVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHeightCnst.constant = 0
        objPreferencesVM.arrMain = objPreferencesVM.arrEntertainment
        Proxy.shared.registerCollViewNib(colVwPreferences, identifierCell: PreferencesCVC.className)
        colVwPreferences.reloadData()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        if objPreferencesVM.currentIndex != 0 {
            objPreferencesVM.currentIndex = objPreferencesVM.currentIndex-1
            switch objPreferencesVM.currentIndex {
            case  PreferenceQuestion.entertainment.rawValue:
                objPreferencesVM.arrMain = objPreferencesVM.arrEntertainment
                lblHeightCnst.constant = 0
            case  PreferenceQuestion.hobbies.rawValue:
                objPreferencesVM.arrMain = objPreferencesVM.arrHobbies
                lblHeightCnst.constant = 0
            case PreferenceQuestion.yourself.rawValue:
                objPreferencesVM.arrMain = objPreferencesVM.arrYourSelf
                lblTitle.text = TitleMessage.describeSelf
                lblHeightCnst.constant = 25
            case PreferenceQuestion.weather.rawValue:
                objPreferencesVM.arrMain = objPreferencesVM.arrWeather
                lblTitle.text = TitleMessage.weather
                lblHeightCnst.constant = 25
            case  PreferenceQuestion.sports.rawValue:
                objPreferencesVM.arrMain = objPreferencesVM.arrSports
                lblHeightCnst.constant = 0
            default:
                break
            }
        } else {
            popToBack()
        }
        colVwPreferences.reloadData()
    }
    @IBAction func actionNext(_ sender: UIButton) {
        objPreferencesVM.currentIndex = objPreferencesVM.currentIndex+1
        switch objPreferencesVM.currentIndex {
        case PreferenceQuestion.entertainment.rawValue:
            objPreferencesVM.arrMain = objPreferencesVM.arrEntertainment
            lblHeightCnst.constant = 0
        case PreferenceQuestion.sports.rawValue:
            objPreferencesVM.arrMain = objPreferencesVM.arrSports
            lblHeightCnst.constant = 0
        case PreferenceQuestion.weather.rawValue:
            objPreferencesVM.arrMain = objPreferencesVM.arrWeather
            lblTitle.text = TitleMessage.weather
            lblHeightCnst.constant = 25
        case PreferenceQuestion.yourself.rawValue:
            objPreferencesVM.arrMain = objPreferencesVM.arrYourSelf
            lblTitle.text = TitleMessage.describeSelf
            lblHeightCnst.constant = 25
        case PreferenceQuestion.hobbies.rawValue:
            objPreferencesVM.arrMain = objPreferencesVM.arrHobbies
            lblHeightCnst.constant = 0
        default:
            pushToNext(SelectTypeVC.className)
            objPreferencesVM.currentIndex = 0
            break
        }
        colVwPreferences.reloadData()
    }
}
