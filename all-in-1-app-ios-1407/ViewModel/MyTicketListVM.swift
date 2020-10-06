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

class MyTicketListVM: NSObject {
    
}

extension MyTicketListVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTicketTVC") as! MyTicketTVC
        cell.vwLeftBg.isHidden = indexPath.row != 0
        cell.vwRightBg.isHidden = indexPath.row != 0
        cell.btnViewTicket.tag = indexPath.row
        cell.btnViewTicket.addTarget(self, action: #selector(actionViewTicket(_ :)), for: .touchUpInside)
        switch indexPath.section {
        case 1:
            if indexPath.row == 0 {
                cell.vwBg.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
                cell.vwBg.layer.cornerRadius = 10
                cell.vwBg.clipsToBounds = true
            }
        default:
            if indexPath.row == 1 {
                cell.vwBg.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
                cell.vwBg.layer.cornerRadius = 10
                cell.vwBg.clipsToBounds = true
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "MyTicketHeaderTVC") as! MyTicketHeaderTVC
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 115
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    @objc func actionViewTicket(_ sender: UIButton) {
        pushToNext(MyTicketVC.className)
    }
}
