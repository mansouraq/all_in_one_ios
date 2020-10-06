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

class CheckOutVM: NSObject {
    
    
}

extension CheckOutVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = Int()
        switch section {
        case 0,2,3,4,5:
            value = 0
        case 1:
            value = 3
        default:
            break
        }
        return value
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 1:
             let checkoutCell = tableView.dequeueReusableCell(withIdentifier: "CheckoutProductTVC") as! CheckoutProductTVC
             cell = checkoutCell
        default:
            let checkoutCell = tableView.dequeueReusableCell(withIdentifier: "CheckoutProductTVC") as! CheckoutProductTVC
            cell = checkoutCell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerCell = UIView()
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddShippingAddressTVC") as! AddShippingAddressTVC
            headerCell = cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutStoreTVC") as! CheckoutStoreTVC
            headerCell = cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddShippingMethodTVC") as! AddShippingMethodTVC
            headerCell = cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutTotalTVC") as! CheckoutTotalTVC
            headerCell = cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PayWithWalletTVC") as! PayWithWalletTVC
            headerCell = cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderOverviewTVC") as! OrderOverviewTVC
            headerCell = cell
        default:
            break
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 100
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var headerSize = CGFloat()
        switch section {
        case 0,4:
            headerSize = 115
        case 1:
            headerSize = 85
        case 2:
            headerSize = 80
        case 3:
            headerSize = 60
        case 5:
            headerSize = 135
        default:
            break
        }
        return headerSize
    }
}
