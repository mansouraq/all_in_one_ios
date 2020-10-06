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

class TopStoreTVC: UITableViewCell {
    @IBOutlet weak var colVwStore: UICollectionView!
    func reloadData() {
        colVwStore.delegate = self
        colVwStore.dataSource = self
        colVwStore.reloadData()
    }
}

class TopCategoryTVC: UITableViewCell {
    @IBOutlet weak var colVwCategory: UICollectionView!
    
    func reloadData() {
        colVwCategory.delegate = self
        colVwCategory.dataSource = self
        colVwCategory.reloadData()
    }
}
class TopSellerTVC: UITableViewCell {
    @IBOutlet weak var colVwSeller: UICollectionView!
    
    func reloadData() {
        colVwSeller.delegate = self
        colVwSeller.dataSource = self
        colVwSeller.reloadData()
    }
}

extension TopCategoryTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCategoryCVC", for: indexPath) as! TopCategoryCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            ((sceneDelegate.window!.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(SortFilterVC.className)
        } else {
            ((KAppDelegate.window?.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(SortFilterVC.className)
        }
    }
}

extension TopStoreTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopStoreCVC", for: indexPath) as! TopStoreCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/4, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            ((sceneDelegate.window!.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(StoreMerchantHomeVC.className)
        } else {
            ((KAppDelegate.window?.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(StoreMerchantHomeVC.className)
        }
    }
}


extension TopSellerTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSellerCVC", for: indexPath) as!TopSellerCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}


