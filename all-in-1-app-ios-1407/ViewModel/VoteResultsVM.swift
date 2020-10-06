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

class VoteResultsVM: NSObject {
    //MARK:- Variables
    var selectedIndex = Int()
}

extension VoteResultsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VotePercentageTVC") as! VotePercentageTVC
        cell.vwBg.layer.borderColor = indexPath.row == objVoteResultsVM.selectedIndex ? Color.dustyOrange.cgColor : Color.lightGreyText.cgColor
        cell.vwBg.removeView()
        cell.lblTitle.textColor = indexPath.row == objVoteResultsVM.selectedIndex ? Color.dustyOrange : .black
        var frame: CGRect = cell.frame
        frame.size.width = frame.size.width*0.66
        frame.origin.y = cell.frame.size.height - frame.size.height
        let bg: UIView = UIView(frame: frame)
        bg.tag = 100
        bg.backgroundColor = UIColor(red: 255/255, green: 89/255, blue: 32/255, alpha: 0.1)
        cell.vwBg.addSubview(bg)
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
        objVoteResultsVM.selectedIndex = indexPath.row
        tblVwVote.reloadData()
    }
}
extension UIView {
    func removeView() {
        if let viewWithTag = self.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        } else{
            print("No!")
        }
    }
}
