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

class AddPositivityPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldAddPositivity: UITextField!
    @IBOutlet weak var vwLine: UIView!
    @IBOutlet weak var txtVwAddPositivity: UITextView!
    @IBOutlet weak var vwBottomHeightCnst: NSLayoutConstraint!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        IQKeyboardManager.shared().isEnabled = false
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
    @IBAction func actionBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionChooseImage(_ sender: Any) {
    }
    @IBAction func actionAddPositivity(_ sender: Any) {
    }
    //MARK:- Handle Keyboard Method
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.vwBottomHeightCnst.constant = keyboardHeight - self.view.safeAreaInsets.bottom
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        vwBottomHeightCnst.constant = 0
    }
}

extension AddPositivityPopupVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = txtVwAddPositivity.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            vwLine.backgroundColor =  updatedText.count != 0 ? Color.dustyOrange : Color.darkGreyText
        }
        return true
    }
}
