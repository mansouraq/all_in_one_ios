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

class OnlineEventVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwOnlineEvent: UITableView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVwOnlineEvent.reloadData()
    }
    
    //MARK:- Object
    var objOnlineEventVM = OnlineEventVM()
    
    //MARK:- IBActions
    @IBAction func actionShare(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionHeader(_ sender: UIButton) {
        if objOnlineEventVM.selectedIndex == sender.tag {
            objOnlineEventVM.selectedIndex = -1
        } else {
            objOnlineEventVM.selectedIndex = sender.tag
        }
        tblVwOnlineEvent.reloadData()
    }
}
