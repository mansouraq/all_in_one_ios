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

class AddPollVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtVwQuestion: IQTextView!
    @IBOutlet weak var txtFldOptionFirst: UITextField!
    @IBOutlet weak var txtFldOptionSecond: UITextField!
    @IBOutlet weak var txtFldOptionThird: UITextField!
    @IBOutlet weak var txtFldOptionFourth: UITextField!
    @IBOutlet weak var txtFldDate: UITextField!
    @IBOutlet weak var vwDate: UIView!
    @IBOutlet weak var vwDateHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var lblParticipantsName: UILabel!
    @IBOutlet weak var imgVwParticipant: RoundedImage!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var btnText: UIButton!
    @IBOutlet weak var btnDate: UIButton!
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    
    @IBAction func actionPollType(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        btnText.backgroundColor = .white
        btnDate.backgroundColor = .white
        btnText.setTitleColor(.black, for: .normal)
        btnDate.setTitleColor(.black, for: .normal)
        sender.backgroundColor = Color.dustyOrange
        sender.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func actionEndPollDate(_ sender: Any) {
    }
    @IBAction func actionMultiVotes(_ sender: Any) {
    }
    @IBAction func actionAnonymousVotes(_ sender: Any) {
    }
    @IBAction func actionNewOption(_ sender: Any) {
    }
    @IBAction func actionSavePoll(_ sender: Any) {
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: ChatVC.self) {
                _ =  self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
