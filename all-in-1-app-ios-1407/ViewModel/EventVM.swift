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


class EventVM : NSObject {
    //MARK:- Variables
    var arrImg = ["rectangleCopy3","rectangleCopy4","rectangleCopy5", "rectangleCopy6"]
    var arritems = ["All", "Sports", "Promo", "Charity"]
    
}

extension EventsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objeventVM.arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromoTVC") as! PromoTVC
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToNext("MyTicketVC")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}
extension EventsVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collVwEvent:
            return objeventVM.arritems.count
        case collVwPopularPromo:
            return 6
        case collVwPromo:
            return 6
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexpath: IndexPath)-> CGFloat {
        switch collectionView {
        case collVwEvent:
            return 36
        case collVwPopularPromo:
            return 140
        case collVwPromo:
            return 238
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwEvent{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCVC",for: indexPath as IndexPath) as! EventCVC
            cell.lblTitle.backgroundColor = indexPath.row == 0 ? Color.dustyOrange : .clear
            cell.lblTitle.borderViewColor = indexPath.row == 0 ? .clear : .white
            return cell
        }else if collectionView == collVwPopularPromo{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularPromoCVC",for: indexPath as IndexPath) as! PopularPromoCVC
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromoCVC",for: indexPath as IndexPath) as! PromoCVC
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collVwEvent{
            return CGSize(width: 62, height: 36)
        }else if collectionView == collVwPopularPromo{
            return CGSize(width: 315, height: 140)
        }else{
            return CGSize(width: 315, height: 238)
        }
    }
}
