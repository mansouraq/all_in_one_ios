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

class PaymentListVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var tblVwPaymentList: UITableView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionPayNow(_ sender: Any) {
        presentVC(identifier: StoreCompletedPopupVC.className, animate: true)
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}


extension PaymentListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderOverviewTVC") as! OrderOverviewTVC
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutShippingMethodTVC") as! CheckoutShippingMethodTVC
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            return 180
        } else {
            return 125
        }
    }
}
