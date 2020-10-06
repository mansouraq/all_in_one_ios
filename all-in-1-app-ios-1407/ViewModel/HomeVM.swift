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
import PinterestLayout

class HomeVM : NSObject {
    //MARK:- Variables
    var arrImg = [
        PinterestItem(image: UIImage(named: "health-1")!, text: ""),
        PinterestItem(image: UIImage(named: "religion")!, text: ""),
        PinterestItem(image: UIImage(named: "music")!, text: ""),
        PinterestItem(image: UIImage(named: "events")!, text: ""),
        PinterestItem(image: UIImage(named: "news")!, text: ""),
        PinterestItem(image: UIImage(named: "sports")!, text: "")
    ]
    var arrTitle = [("Health",HealthVC.className),("Religion",ReligionVC.className),("Music",MusicVC.className),("Events",EventsVC.className),("News",NewsListVC.className),("Sports",SportsVC.className)]
    
}
extension HomeVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTVC") as! HomeTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToNext(NewsDetailsVC.className)
    }
}

extension HomeVC: PinterestLayoutDelegate,UICollectionViewDelegate, UICollectionViewDataSource {
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objHomeVM.arrImg.count
    }
    
    func collectionView(collectionView: UICollectionView,  heightForImageAtIndexPath indexPath: IndexPath,withWidth: CGFloat) -> CGFloat {
        let image = objHomeVM.arrImg[indexPath.item].image
        return image.height(forWidth: withWidth)
    }
    
    public func collectionView(collectionView: UICollectionView,heightForAnnotationAtIndexPath indexPath: IndexPath,withWidth: CGFloat) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HomeCVC",
            for: indexPath) as! HomeCVC
        let item = objHomeVM.arrImg[indexPath.item]
        cell.imgVwCategory.image = item.image
        cell.lblTitle.text = objHomeVM.arrTitle[indexPath.item].0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushToNext(objHomeVM.arrTitle[indexPath.item].1)
    }
}
