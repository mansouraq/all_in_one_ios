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

class OrderListVM: NSObject {
    
    //MARK:-Variables
    var arrOrder = [("ALL","All"),("SHOP","awating payment"),("CHARITY","awaiting fullfilment"),("FOOD DELIVERY","awaiting fullfilment")]
    var selectedIndex = Int()
}

extension OrderListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderListTVC") as! OrderListTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
}

extension OrderListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objOrderListVM.arrOrder.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch collectionView {
        case colVwOrderCategory:
            let catCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrderCategoryCVC", for: indexPath) as! OrderCategoryCVC
            catCell.lblTitle.text = objOrderListVM.arrOrder[indexPath.row].0
            catCell.vwLine.isHidden = objOrderListVM.selectedIndex != indexPath.row
            cell = catCell
        case colVwPayment:
            let paymentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaymentStatusCVC", for: indexPath) as! PaymentStatusCVC
            paymentCell.lblTitle.text = objOrderListVM.arrOrder[indexPath.row].1
            cell = paymentCell
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        if collectionView == colVwPayment {
            var stringToFit = String()
            stringToFit = objOrderListVM.arrOrder[indexPath.row].1
            let font = UIFont.systemFont(ofSize: 15)
            let userAttributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor :UIColor.black]
            let sizeVal = stringToFit.size(withAttributes: userAttributes)
            size = CGSize(width: sizeVal.width+45, height: colVwPayment.frame.height-10)
        }
        return size
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == colVwOrderCategory {
            objOrderListVM.selectedIndex = indexPath.row
            colVwOrderCategory.reloadData()
        }
    }
}
