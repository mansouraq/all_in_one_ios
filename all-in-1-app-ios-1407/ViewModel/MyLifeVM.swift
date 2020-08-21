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

class MyLifeVM {
    //MARK:- Variables
    var arrType = ["All","Appointmenet","To Do List","My Dreams"]
    var arrMyLife = [("Today Appointment","Add New Appointment"),("Today To Do List","Add New To Do List"),("My Dreams","Add New Dream"),("Story","Load More Story"),("Today Positivity","Add More Positivity")]
}

extension MyLifeVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objMyLifeVM.arrType.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyLifeTypeCVC",for: indexPath as IndexPath) as! MyLifeTypeCVC
        cell.lblTitle.text = objMyLifeVM.arrType[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var stringToFit = String()
        stringToFit =  objMyLifeVM.arrType[indexPath.row]
        let font = UIFont.systemFont(ofSize: 15)
        let userAttributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor :UIColor.black]
        let size = stringToFit.size(withAttributes: userAttributes)
        let newSize = CGSize(width: size.width+45, height: collVwType.frame.height-10)
        return newSize
    }
}

extension MyLifeVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objMyLifeVM.arrMyLife.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let todayAppointment = tableView.dequeueReusableCell(withIdentifier: "TodayAppointmentTVC") as! TodayAppointmentTVC
            cell = todayAppointment
        case 1:
            let todayTodo = tableView.dequeueReusableCell(withIdentifier: "TodayTodoTVC") as! TodayTodoTVC
            cell = todayTodo
        case 2:
            let myDream = tableView.dequeueReusableCell(withIdentifier: "MyDreamsTVC") as! MyDreamsTVC
            cell = myDream
        case 3:
            let story = tableView.dequeueReusableCell(withIdentifier: "StoryTVC") as! StoryTVC
            cell = story
        case 4:
            let todayPositivity = tableView.dequeueReusableCell(withIdentifier: "TodayPositivityTVC") as! TodayPositivityTVC
            cell = todayPositivity
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size = CGFloat()
        switch indexPath.section {
        case 0,4:
            size = 100
        case 1:
            size = 80
        case 2:
            size = 90
        case 3:
            size = 120
        default:
            break
        }
        return size
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "MyLifeHeaderTVC") as! MyLifeHeaderTVC
        headerCell.lblTitle.text = objMyLifeVM.arrMyLife[section].0
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerCell = tableView.dequeueReusableCell(withIdentifier: "MyLifeFooterTVC") as! MyLifeFooterTVC
        footerCell.btnAddAppointment.setTitle(objMyLifeVM.arrMyLife[section].1, for: .normal)
        footerCell.tag = section
        return footerCell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
}
