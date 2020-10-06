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

class LoginVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var btnbck: UIButton!
    @IBOutlet weak var txtFieldPhoneNo: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRecoveredPswrd: UIButton!
    @IBOutlet weak var lblCountryCode: UILabel!
    
    //MARK:- Object
    var objLoginVM = LoginVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad(){
        super.viewDidLoad()
        UITextField.connectAllTxtFieldFields(txtfields: [txtFieldPhoneNo,txtFieldPassword])
        guard let country = CountryManager.shared.currentCountry else {
            return
        }
        lblCountryCode.text = country.dialingCode
        objLoginVM.countryCode = country.dialingCode
    }
    
    //MARK:- IBActions
    @IBAction func actionAlreadyAccount(_ sender: Any) {
       
    }
    @IBAction func actionRecoveredPassword(_ sender: Any) {
         pushToNext(ForgotPasswordVC.className)
    }
    @IBAction func actionLogin(_ sender: Any) {
        RootControllerProxy.shared.rootWithDrawer(MainTBC.className)
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionCountryPicker(_ sender: Any) {
        presentCountryPickerScene()
    }
}
