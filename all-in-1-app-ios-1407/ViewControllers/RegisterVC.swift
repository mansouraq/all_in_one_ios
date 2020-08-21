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

class RegisterVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtfieldEmail: UITextField!
    @IBOutlet weak var txtFieldPhoneNo: UITextField!
    @IBOutlet weak var txtFieldPaswword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblCountryCode: UILabel!
    
    //MARK:- Object
    var objRegisterVM = RegisterVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UITextField.connectAllTxtFieldFields(txtfields: [txtfieldEmail,txtFieldPhoneNo,txtFieldPaswword])
        guard let country = CountryManager.shared.currentCountry else {
            return
        }
        lblCountryCode.text = country.dialingCode
        objRegisterVM.countryCode = country.dialingCode
    }
    
    //MARK:- IBActions
    @IBAction func actnLogin(_ sender: Any) {
        pushToNext(LoginVC.className)
    }
    @IBAction func actnRegister(_ sender: Any) {
        pushToNext(VerificationVC.className)
    }
    @IBAction func actionCountryPicker(_ sender: Any) {
        presentCountryPickerScene()
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
