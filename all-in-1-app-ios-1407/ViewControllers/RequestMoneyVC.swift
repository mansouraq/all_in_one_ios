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
import IQKeyboardManager

class RequestMoneyVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imgVwUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtFldAmount: UITextField!
    @IBOutlet weak var btnCurrency: UIButton!
    @IBOutlet weak var txtFldAddNote: UITextField!
    @IBOutlet weak var vwBottomCnst: NSLayoutConstraint!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFldAmount.inputView = Bundle.main.loadNibNamed("LNNumberpad", owner: self, options: nil)?[0] as? UIInputView
        txtFldAmount.inputView = LNNumberpad.default()
    }
    override func viewWillAppear(_ animated: Bool) {
        IQKeyboardManager.shared().isEnabled = false
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        IQKeyboardManager.shared().isEnableAutoToolbar = false
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
    }
    //MARK:- IBActions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height - self.view.safeAreaInsets.bottom
            self.vwBottomCnst.constant = keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        vwBottomCnst.constant = 0
    }
}

extension RequestMoneyVC: UITextFieldDelegate {
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
        presentVC(identifier: SendMoneyVC.className, animate: true)
        return true
    }
}
