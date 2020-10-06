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

protocol DismissController {
    func dismiss()
}

var objDismissControllerDelegate: DismissController?

class ProcessingOrderPopupVC: UIViewController {
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1.3) {
            self.dismiss(animated: true, completion: nil)
            objDismissControllerDelegate?.dismiss()
        }
    }
}
