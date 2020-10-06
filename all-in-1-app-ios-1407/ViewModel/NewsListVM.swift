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
class NewsListVM : NSObject {
    //MARK:- Variable
    var arrNewsType = ["TOP NEWS","WORLD NEWS","POLITCS","ENTERTAINMENT"]
    var selectedIndex = Int()
}
extension NewsListVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    //MARK:- CollectionView Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objNewsListVM.arrNewsType.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsListCVC",for: indexPath as IndexPath) as! NewsListCVC
        cell.vwLine.isHidden = objNewsListVM.selectedIndex != indexPath.row
        cell.lblTitle.text = objNewsListVM.arrNewsType[indexPath.row]
        cell.lblTitle.textColor = objNewsListVM.selectedIndex == indexPath.row ? Color.dustyOrange : .black
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        objNewsListVM.selectedIndex = indexPath.row
        collectionVwNews.reloadData()
    }
}

extension NewsListVC: UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListTVC") as! NewsListTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListHeaderTVC") as! NewsListHeaderTVC
            return cell
       
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}
