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

class DreamListVM: NSObject {
    var selectedSection = -1
    var selectedIndex = 0
}

extension DreamListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DreamCVC", for: indexPath) as! DreamCVC
        return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: 100)
    }
}

extension DreamListVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if objDreamListVM.selectedSection == section {
            return 3
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DreamTVC") as! DreamTVC
        cell.lblTitle.isHidden = indexPath.row != 0
        cell.lblHeightCnst.constant = indexPath.row == 0 ? 18 : 0
        cell.imgVwTick.isHighlighted = objDreamListVM.selectedIndex == indexPath.row
        if indexPath.row == 2 {
            cell.vwBg.layer.maskedCorners  = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
            cell.vwBg.layer.cornerRadius = 10
        } else {
            cell.vwBg.layer.cornerRadius = 0
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "DreamHeaderTVC") as! DreamHeaderTVC
        headerCell.btnSection.tag = section
        headerCell.vwBg.layer.cornerRadius = 10
        if objDreamListVM.selectedSection != section {
             headerCell.vwBg.layer.maskedCorners  = [.layerMinXMinYCorner,.layerMaxXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
        } else {
            headerCell.vwBg.layer.maskedCorners  = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 97
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 70 : 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        objDreamListVM.selectedIndex = indexPath.row
        tblVwDreamList.reloadData()
    }
}
