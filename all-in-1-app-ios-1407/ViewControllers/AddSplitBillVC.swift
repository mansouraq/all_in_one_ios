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

class AddSplitBillVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldTotalAmount: UITextField!
    @IBOutlet weak var lblParticipants: UILabel!
    @IBOutlet weak var lblCurrency: UILabel!
    @IBOutlet weak var imgVwParticipantUser: RoundedImage!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var vwIdenticalAmount: UIView!
    @IBOutlet weak var vwIdenticalHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var imgVwSelfUser: RoundedImage!
    @IBOutlet weak var imgVwParticipant: RoundedImage!
    @IBOutlet weak var lblParticipantName: UILabel!
    @IBOutlet weak var lblAmountUser: UILabel!
    @IBOutlet weak var lblAmountParticipantUser: UILabel!
    @IBOutlet weak var txtVwDetail: IQTextView!
    @IBOutlet weak var lblTotalPrice: UILabel!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionChooseCurrency(_ sender: Any) {
        
    }
    @IBAction func actionChooseIdenticalAmount(_ sender: UISwitch) {
        if sender.isOn == true {
            vwIdenticalAmount.isHidden = true
            vwIdenticalHeightCnst.constant = 0
        } else {
            vwIdenticalAmount.isHidden = false
            vwIdenticalHeightCnst.constant = 135
        }
    }
    @IBAction func actionCreateNow(_ sender: Any) {
        let controller  = mainStoryboard.instantiateViewController(withIdentifier: SendToChatPopupVC.className) as! SendToChatPopupVC
        controller.objDismissData = {
            for controller in self.navigationController!.viewControllers as Array {
                if controller.isKind(of: ChatVC.self) {
                    _ =  self.navigationController!.popToViewController(controller, animated: true)
                    break
                }
            }
        }
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}
