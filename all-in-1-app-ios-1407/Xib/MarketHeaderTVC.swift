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

class MarketHeaderTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
}
class MarketExploreTVC: UITableViewCell {
    @IBOutlet weak var colVwExplore: UICollectionView!
    
    var arrCat = ["Store","Charity","Jobs","Booking","Food Delivery","Ticket & Hotel"]
    var arrCatImg = [#imageLiteral(resourceName: "imgCategoryShop"),#imageLiteral(resourceName: "imgCategoryCharity"),#imageLiteral(resourceName: "imgCategoryJobs"),#imageLiteral(resourceName: "undrawLocationReviewDmxd"),#imageLiteral(resourceName: "foodDelivery"),#imageLiteral(resourceName: "ticketHotel")]
    
    func reloadData() {
        colVwExplore.delegate = self
        colVwExplore.dataSource = self
        colVwExplore.reloadData()
    }
}
class MarketTrendingTVC: UITableViewCell {
    @IBOutlet weak var colVwTrending: UICollectionView!
    
    func reloadData() {
        colVwTrending.delegate = self
        colVwTrending.dataSource = self
        colVwTrending.reloadData()
    }
}

extension MarketExploreTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketExploreCVC", for: indexPath) as! MarketExploreCVC
        cell.lblTitle.text = arrCat[indexPath.row]
        cell.imgVwExplore.image = arrCatImg[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.5, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if #available(iOS 13.0, *) {
                let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
                ((sceneDelegate.window!.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(StoreVC.className)
            } else {
                ((KAppDelegate.window?.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(StoreVC.className)
            }
        } else if indexPath.row == 4 {
            if #available(iOS 13.0, *) {
                let sceneDelegate = UIApplication.shared.connectedScenes
                    .first!.delegate as! SceneDelegate
                ((sceneDelegate.window!.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(PartyPlanarVC.className)
            } else {
                ((KAppDelegate.window?.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(PartyPlanarVC.className)
            }
        }
    }
}

extension MarketTrendingTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketTrendingCVC", for: indexPath) as! MarketTrendingCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


