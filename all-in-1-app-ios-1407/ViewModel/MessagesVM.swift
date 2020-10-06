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

class MessagesVM : NSObject {
    
    //MARK:- Variables
    var selectedType = Int()
    
}
extension MessagesVC: UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var tblCell = UITableViewCell()
        switch objMessagesVM.selectedType {
        case 0,1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MessagesTVC") as! MessagesTVC
            tblCell = cell
        case 2:
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "RequestTVC") as! RequestTVC
                tblCell = cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PeopleYouKnowTVC") as! PeopleYouKnowTVC
                tblCell = cell
            }
        default:
            break
        }
        
        return tblCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if objMessagesVM.selectedType == 0 || objMessagesVM.selectedType == 1 {
            return 115
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if objMessagesVM.selectedType == 0 || objMessagesVM.selectedType == 1 {
            return 0
        } else {
            return 60
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "FriendRequestHeaderTVC") as! FriendRequestHeaderTVC
        headerCell.lblTitle.text = section == 0 ? "Friend Request" : "People you might know"
        return headerCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToNext(ChatVC.className)
    }
}
extension MessagesVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexpath: IndexPath)-> CGFloat {
        
        return 125
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MessagesCVC",for: indexPath as IndexPath) as! MessagesCVC
        cell.vwBg.isHidden = indexPath.row != 0
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 175, height: 145)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentVC(identifier: DreamPopUpVC.className, animate: true)
    }
}

