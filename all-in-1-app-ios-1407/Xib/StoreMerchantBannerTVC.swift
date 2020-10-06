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

class StoreMerchantBannerTVC: UITableViewCell {
    @IBOutlet weak var colVwBanner: UICollectionView!
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var imgVwStore: RoundedImage!
    @IBOutlet weak var lblFollowerCount: UILabel!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var btnFollowStore: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnProduct: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    func reloadData() {
        colVwBanner.delegate = self
        colVwBanner.dataSource = self
        colVwBanner.reloadData()
    }
}
class StoreMerchantHomeTVC: UITableViewCell {
    @IBOutlet weak var colVwBanner: UICollectionView!
    @IBOutlet weak var pageControlStore: UIPageControl!
    
    var scrollTimer = Timer()
    var index = 1
    
    func reloadData() {
        colVwBanner.delegate = self
        colVwBanner.dataSource = self
        colVwBanner.reloadData()
    }
}
class StoreMerchantHeaderTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
}
class StoreMerchantFilterTVC: UITableViewCell {
    @IBOutlet weak var colVwFilter: UICollectionView!
    func reloadData() {
        colVwFilter.delegate = self
        colVwFilter.dataSource = self
        colVwFilter.reloadData()
    }
}
class StoreMerchantProductTVC: UITableViewCell {
    @IBOutlet weak var colVwProduct: UICollectionView!
    func reloadData() {
        colVwProduct.delegate = self
        colVwProduct.dataSource = self
        colVwProduct.reloadData()
    }
}
class StoreMerchantReviewTVC: UITableViewCell {
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var vwRatingProfessional: FloatRatingView!
    @IBOutlet weak var vwRatingTime: FloatRatingView!
    @IBOutlet weak var vwRatingExperience: FloatRatingView!
    @IBOutlet weak var vwRatingValue: FloatRatingView!
}
class StoreMerchantRatingListTVC: UITableViewCell {
    @IBOutlet weak var imgVwUser: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var vwRating: FloatRatingView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var colVwRating: UICollectionView!
    func reloadData() {
        colVwRating.delegate = self
        colVwRating.dataSource = self
        colVwRating.reloadData()
    }
}

extension StoreMerchantBannerTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreMerchantBannerCVC", for: indexPath) as! StoreMerchantBannerCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
extension StoreMerchantHomeTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreMerchantHomeCVC", for: indexPath) as! StoreMerchantHomeCVC
        //scrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = colVwBanner.contentOffset
        visibleRect.size = colVwBanner.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = colVwBanner.indexPathForItem(at: visiblePoint) else { return }
        pageControlStore.currentPage = indexPath.row
    }
    
    @objc func scrollAutomatically(_ timer1: Timer) {
        if index < 3 {
            let indexPath = IndexPath(item: index, section: 0)
            colVwBanner.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            index = index + 1
            pageControlStore.currentPage = indexPath.row
        } else {
            index = 0
            colVwBanner.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            pageControlStore.currentPage = index
        }
    }
}
extension StoreMerchantProductTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedProductCVC", for: indexPath) as! RelatedProductCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.frame.size.width/2-10, height: 240)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if #available(iOS 13.0, *) {
            let sceneDelegate = UIApplication.shared.connectedScenes
                .first!.delegate as! SceneDelegate
            ((sceneDelegate.window!.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(ProductDetailVC.className)
        } else {
            ((KAppDelegate.window?.rootViewController as? SlideMenuController)?.mainViewController as? UINavigationController)?.visibleViewController?.pushToNext(ProductDetailVC.className)
        }
    }
}
extension StoreMerchantFilterTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreMerchantFilterCVC", for: indexPath) as! StoreMerchantFilterCVC
        cell.lblFilter.text = indexPath.row == 0 ? "Sort" : "Product Category"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return  CGSize(width: collectionView.frame.size.width/3, height: 50)
        } else {
            return  CGSize(width: collectionView.frame.size.width/1.8, height: 50)
        }
    }
}
extension StoreMerchantRatingListTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingReviewCVC", for: indexPath) as! RatingReviewCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/5, height: 75)
    }
}
