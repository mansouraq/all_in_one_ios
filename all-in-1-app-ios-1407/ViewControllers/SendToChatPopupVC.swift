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
typealias DismissData = () -> ()

class SendToChatPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVwUser: RoundedImage!
    
     var objDismissData : DismissData?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionSendToChat(_ sender: Any) {
        guard let block = objDismissData else {return}
        dismiss(animated: true, completion: nil)
        block()
    }
    @IBAction func actionCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
