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

class ShippingListVM: NSObject {
    
    //MARK:- Variables
    var selectedIndex = Int()
}

extension ShippingListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShippingListTVC") as! ShippingListTVC
        cell.vwBg.layer.borderColor = objShippingListVM.selectedIndex == indexPath.row ? Color.dustyOrange.cgColor : UIColor.clear.cgColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        objShippingListVM.selectedIndex = indexPath.row
        tblVwShipping.reloadData()
        popToBack()
    }
}
