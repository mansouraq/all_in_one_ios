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

class CartListVM: NSObject {
    var selectedIndex = -1
    var selectedArr = NSMutableArray()
}

extension CartListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartListVipTVC") as! CartListVipTVC
            cell.btnTick.isSelected = objCartListVM.selectedIndex == indexPath.row
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartListTVC") as! CartListTVC
            cell.btnTick.isSelected = objCartListVM.selectedArr.contains(indexPath.row)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 85 : 190
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            objCartListVM.selectedIndex = objCartListVM.selectedIndex == -1 ? indexPath.row : -1
        } else {
            if objCartListVM.selectedArr.contains(indexPath.row) {
                objCartListVM.selectedArr.remove(indexPath.row)
            } else {
                objCartListVM.selectedArr.add(indexPath.row)
            }
        }
        tblVwCart.reloadData()
    }
}
