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
import OnlyPictures

class VoteVM: NSObject {
    
    //MARK:- Variables
    var selectedIndex = Int()
}

extension VoteVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VoteAnswerTVC") as! VoteAnswerTVC
        cell.vwBg.layer.borderColor = indexPath.row == objVoteVM.selectedIndex ? Color.dustyOrange.cgColor : Color.lightGreyText.cgColor
        cell.imgVwTick.isHighlighted = indexPath.row == objVoteVM.selectedIndex
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "VoteHeaderTVC") as! VoteHeaderTVC
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        objVoteVM.selectedIndex = indexPath.row
        tblVwVote.reloadData()
    }
}
extension VoteVC: OnlyPicturesDataSource{
    
    func numberOfPictures() -> Int {
        return 20
    }
    
    func visiblePictures() -> Int {
        return 4
    }
    
    func pictureViews(index: Int) -> UIImage {
        return #imageLiteral(resourceName: "imgReview")
    }
    
    func pictureViews(_ imageView: UIImageView, index: Int) {
        imageView.image = #imageLiteral(resourceName: "imgReview")
    }
    
    func pictureView(_ imageView: UIImageView, didSelectAt index: Int) {
        debugPrint(index)
    }
}

