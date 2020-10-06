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

class SelectMembersVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwSelectMembers: UITableView!
    @IBOutlet weak var txtFldSearch: UITextField!
    
    //MARK:- Object
    var objSelectMemberVM = SelectMembersVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSelectMember(_ sender: Any) {
        pushToNext(AddSplitBillVC.className)
    }
    @IBAction func actionSelectAll(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
