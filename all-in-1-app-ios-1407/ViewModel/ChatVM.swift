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

class ChatVM: NSObject {
    var arrItems = ["Files","Contact","Location","Poll","Split Bill","Event","Send Money","Request Money"]
    var arrItemsImg = [#imageLiteral(resourceName: "addressCard"),#imageLiteral(resourceName: "addressCard"),#imageLiteral(resourceName: "marker2"),#imageLiteral(resourceName: "thunderMove"),#imageLiteral(resourceName: "clipboard"),#imageLiteral(resourceName: "notification2"),#imageLiteral(resourceName: "wallet-1"),#imageLiteral(resourceName: "wallet2")]
}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            let receiverCell = tableView.dequeueReusableCell(withIdentifier: "ReceiverTxtTVC") as! ReceiverTxtTVC
            cell = receiverCell
        case 1:
            let senderCell = tableView.dequeueReusableCell(withIdentifier: "SenderTxtTVC") as! SenderTxtTVC
            cell = senderCell
        case 2:
            let receiverCell = tableView.dequeueReusableCell(withIdentifier: "ReceiverImgTVC") as! ReceiverImgTVC
            cell = receiverCell
        case 3:
            let senderCell = tableView.dequeueReusableCell(withIdentifier: "SenderImgTVC") as! SenderImgTVC
            cell = senderCell
        case 4:
            let billCell = tableView.dequeueReusableCell(withIdentifier: "ViewSplitBillTVC") as! ViewSplitBillTVC
            cell = billCell
        case 5:
            let pollCell = tableView.dequeueReusableCell(withIdentifier: "ViewPollTVC") as! ViewPollTVC
            cell = pollCell
        case 6:
            let eventCell = tableView.dequeueReusableCell(withIdentifier: "ViewEventTVC") as! ViewEventTVC
            cell = eventCell
        case 7:
            let moneyCell = tableView.dequeueReusableCell(withIdentifier: "ViewMoneyTVC") as! ViewMoneyTVC
            cell = moneyCell
        case 8:
            let locationCell = tableView.dequeueReusableCell(withIdentifier: "ViewLocationTVC") as! ViewLocationTVC
            cell = locationCell
        default:
            break
        }
        return cell
    }
}

extension ChatVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatItemsCVC", for: indexPath) as! ChatItemsCVC
        cell.lblTitle.text = objChatVM.arrItems[indexPath.row]
        cell.imgVwItem.image = objChatVM.arrItemsImg[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: collectionView.frame.size.width/4, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            pushToNext(ChooseLocationVC.className)
        case 3:
            pushToNext(CreatePollVC.className)
        case 4:
            pushToNext(CreateSplitBillVC.className)
        case 5:
            pushToNext(CreateEventVC.className)
        case 6:
           presentVC(identifier: RequestMoneyVC.className, animate: true)
        case 7:
           presentVC(identifier: WalletIntroCardVC.className, animate: true)
        default:
            break
        }
    }
}
