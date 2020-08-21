
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

class MomentVM: NSObject {
    
}

extension MomentVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5 {
            return 2
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section == 5 {
            let commentCell = tableView.dequeueReusableCell(withIdentifier: "MomentCommentTVC") as! MomentCommentTVC
            commentCell.vwCommentHeightCnst.constant = indexPath.row == 1 ? 35 : 0
            commentCell.vwMoreComment.isHidden = indexPath.row != 1
            cell = commentCell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerCell = UIView()
        switch section {
        case 1,5:
            let flightCell = tableView.dequeueReusableCell(withIdentifier: "MomentFlightTVC") as! MomentFlightTVC
            flightCell.reloadData(section)
            headerCell = flightCell
        case 2:
            let quoteCell = tableView.dequeueReusableCell(withIdentifier: "MomentQuoteTVC") as! MomentQuoteTVC
            headerCell = quoteCell
        case 4:
            let textCell = tableView.dequeueReusableCell(withIdentifier: "MomentTextTVC") as! MomentTextTVC
            headerCell = textCell
        case 3,6:
            let videoCell = tableView.dequeueReusableCell(withIdentifier: "MomentVideoTVC") as! MomentVideoTVC
            headerCell = videoCell
        default:
            break
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var size = CGFloat()
        switch section {
        case 1:
            size = 290.0
        case 2:
            size = 190.0
        case 4:
            size = 160.0
        case 5:
            size = 380.0
        case 3,6:
            size = 160.0
        default:
            break
        }
        return size
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size = CGFloat()
        if indexPath.section == 5 {
            size = indexPath.row == 0 ? 180.0 : 200.0
        }
        return size
    }
}
