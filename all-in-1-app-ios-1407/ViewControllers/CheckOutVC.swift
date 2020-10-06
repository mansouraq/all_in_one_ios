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

class CheckOutVC: UIViewController, DismissController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwCheckout: UITableView!
    @IBOutlet weak var lblPrice: UILabel!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        objDismissControllerDelegate = self
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionPurchase(_ sender: Any) {
        presentVC(identifier: ProcessingOrderPopupVC.className, animate: true)
    }
    @IBAction func actionAddShippingInfo(_ sender: Any) {
        pushToNext(ShippingListVC.className)
    }
    @IBAction func actionPayWithWallet(_ sender: Any) {
        pushToNext(PaymentListVC.className)
    }
    @IBAction func actionChooseShipping(_ sender: Any) {
        presentVC(identifier: ChooseShippingVC.className, animate: true)
    }
    func dismiss() {
        self.presentVC(identifier: StoreCompletedPopupVC.className, animate: true)
    }
}
