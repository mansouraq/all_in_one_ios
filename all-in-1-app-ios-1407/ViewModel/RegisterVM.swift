
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
import SKCountryPicker

class RegisterVM: NSObject {
    
    //MARK:- Variables
    var countryCode: String?
}

extension RegisterVC  {
    func presentCountryPickerScene() {
        let countryController = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
            guard let self = self else { return }
            self.lblCountryCode.text = country.dialingCode
            self.objRegisterVM.countryCode = country.dialingCode
        }
        countryController.flagStyle = .circular
    }
}
