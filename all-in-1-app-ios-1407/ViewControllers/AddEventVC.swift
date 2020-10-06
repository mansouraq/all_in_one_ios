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

class AddEventVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lblParticipant: UILabel!
    @IBOutlet weak var txtVwDetail: IQTextView!
    @IBOutlet weak var txtFldLocation: UITextField!
    @IBOutlet weak var txtFldEndDate: UITextField!
    @IBOutlet weak var txtFldStartingDate: UITextField!
    @IBOutlet weak var txtFldEventTitle: UITextField!
    @IBOutlet weak var imgVwUser: RoundedImage!
    
    @IBOutlet weak var imgVwAnotherUser: RoundedImage!
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
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
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
