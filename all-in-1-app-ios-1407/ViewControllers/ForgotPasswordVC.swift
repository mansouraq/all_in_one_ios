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

class ForgotPasswordVC: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var txtFldEmail: UITextField!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //MARK: IBAutlets
    @IBAction func actionSend(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}

