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

class SendMoneyVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldAmount: UITextField!
    @IBOutlet weak var txtFldFirst: UITextField!
    @IBOutlet weak var txtFldSecond: UITextField!
    @IBOutlet weak var txtFldThird: UITextField!
    @IBOutlet weak var txtFldFourth: UITextField!
    @IBOutlet weak var txtFldFifth: UITextField!

     //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldAmount.inputView = Bundle.main.loadNibNamed("LNNumberpad", owner: self, options: nil)?[0] as? UIInputView
               txtFldAmount.inputView = LNNumberpad.default()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionUseFaceId(_ sender: Any) {
    }
}

extension SendMoneyVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        txtFldAmount.text = ""
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtFldAmount.resignFirstResponder()
        return true
    }
}
