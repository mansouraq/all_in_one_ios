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

class VerificationVM: NSObject {
    //MARK:- Variables
    var timer: Timer?
    var counter = 30
}

extension VerificationVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range:NSRange, replacementString string: String) -> Bool {
        
        if (range.length == 0){
            switch textField {
            case txtFldFirst:
                txtFldSecond?.becomeFirstResponder()
            case txtFldSecond:
                txtFldThird?.becomeFirstResponder()
            case txtFldThird:
                txtFldFourth?.becomeFirstResponder()
            case txtFldFourth:
                txtFldFifth?.becomeFirstResponder()
            case txtFldFifth:
                txtFldFifth?.resignFirstResponder()
            default:
                break
            }
            textField.text? = string
            return false
        }
        else if (range.length == 1) {
            switch textField {
            case txtFldFifth:
                txtFldFourth?.becomeFirstResponder()
            case txtFldFourth:
                txtFldThird?.becomeFirstResponder()
            case txtFldThird:
                txtFldSecond?.becomeFirstResponder()
            case txtFldSecond:
                txtFldFirst?.becomeFirstResponder()
            case txtFldFirst:
                txtFldFirst?.resignFirstResponder()
            default:
                break
            }
            textField.text? = ""
            return false
        }
        return true
    }
}
