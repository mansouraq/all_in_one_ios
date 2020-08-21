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

class AddAppointmentPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldAddAppointment: UITextField!
    @IBOutlet weak var vwLine: UIView!
    @IBOutlet weak var btnShowDateTime: UIButton!
    @IBOutlet weak var vwDateTime: UIView!
    @IBOutlet weak var vwDateHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var vwPriorityRepeatHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var vwPriorityRepeat: UIView!
    @IBOutlet weak var vwPriority: RoundedView!
    @IBOutlet weak var btnNormalPriority: UIButton!
    @IBOutlet weak var btnNoRepeat: UIButton!
    @IBOutlet weak var vwNoRepeat: RoundedView!
    @IBOutlet weak var vwNameRemind: UIView!
    @IBOutlet weak var vwNameRemindHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var vwAddNote: UIView!
    @IBOutlet weak var vwAddNoteHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var lblNotes: UILabel!
    @IBOutlet weak var vwNotes: UIView!
    @IBOutlet weak var txtVwAddNotes: IQTextView!
    @IBOutlet weak var colVwAppointment: UICollectionView!
    @IBOutlet weak var vwType: UIView!
    @IBOutlet weak var vwChoosePriority: UIView!
    @IBOutlet weak var vwRepeat: UIView!
    @IBOutlet weak var vwRemind: UIView!
    @IBOutlet weak var vwBottomCnst: NSLayoutConstraint!
    @IBOutlet weak var vwNotesHeightCnst: NSLayoutConstraint!
    
    //MARK:- Object
    var objAddAppointmentPopupVM = AddAppointmentPopupVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        vwDateHeightCnst.constant = 0
        vwPriorityRepeatHeightCnst.constant = 0
        vwNameRemindHeightCnst.constant = 0
        vwNotesHeightCnst.constant = 0
        vwAddNoteHeightCnst.constant = 0
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
    @IBAction func actionAddAppointment(_ sender: Any) {
    }
    @IBAction func actionCancelDate(_ sender: Any) {
    }
    @IBAction func actionCancelPriority(_ sender: Any) {
    }
    @IBAction func actionCancelRepeat(_ sender: Any) {
    }
    @IBAction func actionCancelNote(_ sender: Any) {
    }
    @IBAction func actionChoosePriority(_ sender: Any) {
    }
    @IBAction func actionChooseRemind(_ sender: Any) {
    }
    @IBAction func actionChooseRepeatness(_ sender: Any) {
    }
    //MARK:- Handle Keyboard Method
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.vwBottomCnst.constant = keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        vwBottomCnst.constant = 0
    }
}

