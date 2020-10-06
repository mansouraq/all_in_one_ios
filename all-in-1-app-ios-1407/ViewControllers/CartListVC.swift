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

class CartListVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwCart: UITableView!
    @IBOutlet weak var lblPrice: UILabel!
    
    //MARK:- Objects
    var objCartListVM = CartListVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionPurchaseNow(_ sender: Any) {
        pushToNext(CheckOutVC.className)
    }
    @IBAction func actionSelectAll(_ sender: Any) {
    }
    @IBAction func actionDelete(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
}
