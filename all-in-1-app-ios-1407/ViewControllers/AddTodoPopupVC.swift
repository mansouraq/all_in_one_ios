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

class AddTodoPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldAddTask: UITextField!
    @IBOutlet weak var vwLine: UIView!
    @IBOutlet weak var btnAddTask: UIButton!
    @IBOutlet weak var vwDate: UIView!
    @IBOutlet weak var btnDate: UIButton!
    @IBOutlet weak var vwDateHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var vwPriority: UIView!
    @IBOutlet weak var btnPriority: UIButton!
    @IBOutlet weak var vwPriorityHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var btnDateTime: UIButton!
    @IBOutlet weak var btnAddPriority: UIButton!
    @IBOutlet weak var btnAddNotes: UIButton!
    @IBOutlet weak var vwMainBottomCnst: NSLayoutConstraint!
    @IBOutlet weak var vwChoosePriority: UIView!
    @IBOutlet weak var vwChoosePriorityHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var btnVeryImportant: UIButton!
    @IBOutlet weak var btnImportant: UIButton!
    @IBOutlet weak var btnNormal: UIButton!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        vwPriorityHeightCnst.constant = 0
        vwDateHeightCnst.constant = 0
        vwChoosePriorityHeightCnst.constant = 0
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
    @IBAction func actionDateTime(_ sender: Any) {
        let controller = mainStoryboard.instantiateViewController(withIdentifier: "ChooseDateTimeVC") as! ChooseDateTimeVC
        controller.objPassDate = { (date,title) in
            self.vwDateHeightCnst.constant = 50
            self.vwDate.isHidden = false
            self.btnDateTime.isHidden = true
            let date = date.stringFromFormat("YYYY MM dd HH:mm:ss")
            self.btnDate.setTitle(date, for: .normal)
        }
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func actionAddTask(_ sender: Any) {
    }
    @IBAction func actionDateCross(_ sender: Any) {
        self.vwDateHeightCnst.constant = 0
        self.vwDate.isHidden = true
        self.btnDateTime.isHidden = false
    }
    @IBAction func actionPriorityCross(_ sender: Any) {
        self.vwPriorityHeightCnst.constant = 0
        self.vwPriority.isHidden = true
        self.btnAddPriority.isHidden = false
    }
    @IBAction func actionAddNote(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionAddPriority(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        vwChoosePriorityHeightCnst.constant = sender.isSelected ? 110 : 0
        vwChoosePriority.isHidden = !sender.isSelected
        let windowCount = UIApplication.shared.windows.count
        let customView = UIView(frame: CGRect(x: 0, y: self.view.frame.size.height-300, width: 200, height: 300))
             customView.backgroundColor = UIColor.clear
        customView.layer.zPosition = CGFloat(MAXFLOAT)
        customView.addSubview(vwChoosePriority)
        UIApplication.shared.windows[windowCount-1].addSubview(customView)
     
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionChoosePriority(_ sender: UIButton) {
        vwPriorityHeightCnst.constant = 50
        vwPriority.isHidden = false
        vwChoosePriorityHeightCnst.constant = 0
        vwChoosePriority.isHidden = true
        btnAddPriority.isHidden = true
    }
    //MARK:- Handle Keyboard Method
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.vwMainBottomCnst.constant = keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        vwMainBottomCnst.constant = 0
    }
}


extension AddTodoPopupVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = txtFldAddTask.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            btnAddTask.isSelected = updatedText.count != 0
            vwLine.backgroundColor =  updatedText.count != 0 ? Color.dustyOrange : Color.lightGreyText
        }
        return true
    }
}
