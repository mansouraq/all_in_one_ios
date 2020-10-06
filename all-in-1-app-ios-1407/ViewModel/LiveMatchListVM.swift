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

class LiveMatchListVM: NSObject {
    
    //MARK:- Variables
    var arrLiveMatch = ["LIVE","STATS","INFO","LINE UP"]
    var selectedIndex = Int()
}

extension LiveMatchListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == colVwLiveScore {
            return 1
        } else {
            return objLiveMatchListVM.arrLiveMatch.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colVwLiveScore {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveScoreCVC", for: indexPath) as! LiveScoreCVC
            cell.vwBg.addGradiant()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LiveCategoryCVC", for: indexPath) as! LiveCategoryCVC
            cell.lblTitle.text = objLiveMatchListVM.arrLiveMatch[indexPath.row]
            cell.vwBg.backgroundColor = objLiveMatchListVM.selectedIndex == indexPath.row ? Color.green : .clear
            cell.lblTitle.textColor = objLiveMatchListVM.selectedIndex == indexPath.row ? .white : .darkGray
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == colVwLiveCategory {
            objLiveMatchListVM.selectedIndex = indexPath.row
            colVwLiveCategory.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colVwLiveScore {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        } else {
            return CGSize(width: collectionView.frame.size.width/4, height: 55)
        }
    }
}

extension LiveMatchListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LiveScoreTVC") as! LiveScoreTVC
        cell.processBar1.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        65
    }
}
