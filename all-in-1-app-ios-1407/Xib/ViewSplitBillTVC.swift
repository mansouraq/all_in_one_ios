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

class ViewSplitBillTVC: UITableViewCell {
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBAction func actionSplitBill(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            ((sceneDelegate.window!.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(SplitBillDetailVC.className)
        } else {
            ((KAppDelegate.window?.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(SplitBillDetailVC.className)
        }
    }
}
