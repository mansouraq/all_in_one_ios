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

class YourPersonalityVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var collViewInfo: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwHeader: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    //MARK:- Variables
    var objYourPersonalityVM = YourPersonalityVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        objYourPersonalityVM.arrMain = objYourPersonalityVM.arrGender
        lblTitle.text = TitleMessage.gender
        Proxy.shared.registerCollViewNib(collViewInfo, identifierCell: InfoCVC.className)
        collViewInfo.reloadData()
    }
    
    
    @IBAction func actionBack(_ sender: UIButton) {
        if objYourPersonalityVM.currentIndex != 0 {
            objYourPersonalityVM.currentIndex = objYourPersonalityVM.currentIndex-1
            switch objYourPersonalityVM.currentIndex {
            case PersonalityQuestion.gender.rawValue:
                objYourPersonalityVM.arrMain = objYourPersonalityVM.arrGender
                lblTitle.text = TitleMessage.gender
                vwHeader.isHidden = true
            case PersonalityQuestion.feelings.rawValue:
                objYourPersonalityVM.arrMain = objYourPersonalityVM.arrFeelings
                lblTitle.text = TitleMessage.feeling
            case PersonalityQuestion.organized.rawValue:
                objYourPersonalityVM.arrMain = objYourPersonalityVM.arrOrganized
                lblTitle.text = TitleMessage.oraganized
                break
            default:
                break
            }
        }
        collViewInfo.reloadData()
    }
    
    @IBAction func actionNext(_ sender: UIButton) {
        objYourPersonalityVM.currentIndex = objYourPersonalityVM.currentIndex+1
        switch objYourPersonalityVM.currentIndex {
        case PersonalityQuestion.gender.rawValue:
            objYourPersonalityVM.arrMain = objYourPersonalityVM.arrGender
            lblTitle.text = TitleMessage.gender
        case PersonalityQuestion.feelings.rawValue:
            objYourPersonalityVM.arrMain = objYourPersonalityVM.arrFeelings
            vwHeader.isHidden = false
            lblTitle.text = TitleMessage.feeling
        case PersonalityQuestion.organized.rawValue:
            objYourPersonalityVM.arrMain = objYourPersonalityVM.arrOrganized
            vwHeader.isHidden = false
            lblTitle.text = TitleMessage.oraganized
        default:
            pushToNext(PreferencesVC.className)
            objYourPersonalityVM.currentIndex = PersonalityQuestion.organized.rawValue
        }
        collViewInfo.reloadData()
    }
}

