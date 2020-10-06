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

class OnlineEventVM: NSObject {
    //MARK:- Variable
    var arrayHeader = ["","","Event Gallery","About this Event","Ticketing",""]
    var selectedIndex = -1
}
extension OnlineEventVC: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objOnlineEventVM.arrayHeader.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var value = Int()
        switch section {
        case 0,2,5:
            value = 1
        case 1:
            value = 4
        case 3,4:
            if objOnlineEventVM.selectedIndex == section {
                value = 1
            } else {
                value = 0
            }
        default:
            break
        }
        return value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let bannerCell = tableView.dequeueReusableCell(withIdentifier: "OnlineEventBannerTVC") as! OnlineEventBannerTVC
            bannerCell.reloadData()
            cell = bannerCell
        case 1:
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "EventAddressTVC") as! EventAddressTVC
            addressCell.btnViewMap.isHidden = indexPath.row != 3
            cell = addressCell
        case 2:
            let galleryCell = tableView.dequeueReusableCell(withIdentifier: "EventGalleryTVC") as! EventGalleryTVC
            galleryCell.reloadData()
            cell = galleryCell
        case 3,4:
            let aboutEventCell = tableView.dequeueReusableCell(withIdentifier: "AboutEventTVC") as! AboutEventTVC
            cell = aboutEventCell
        case 5:
            let attendEventCell = tableView.dequeueReusableCell(withIdentifier: "EventAttendTVC") as! EventAttendTVC
            attendEventCell.reloadData()
            cell = attendEventCell
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size = CGFloat()
        switch indexPath.section {
        case 0:
            size = 380
        case 1:
            size = indexPath.row == 3 ? 120 : 80
        case 2:
            size = 500
        case 3,4:
            size = 280
        case 5:
            size = 310
        default:
            break
        }
        return size
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventHeaderTVC") as! EventHeaderTVC
        cell.lblTitle.text = objOnlineEventVM.arrayHeader[section]
        cell.imgVwCircle.isHidden = section == 2
        cell.btnHeader.tag = section
        return cell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 || section == 3 || section == 4 ? 70 : 0
    }
}
