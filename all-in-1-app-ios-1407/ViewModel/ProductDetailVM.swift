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

class ProductDetailVM: NSObject {
    
    //MARK:- Variables
    var scrollTimer = Timer()
    var index = 1
}


extension ProductDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch collectionView {
        case colVwBanner:
            let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailBannerCVC", for: indexPath) as! ProductDetailBannerCVC
            cell = bannerCell
        case colVwChooseColor:
            let colorCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseColorCVC", for: indexPath) as! ChooseColorCVC
            cell = colorCell
        case colVwChooseSize:
            let sizeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseSizeCVC", for: indexPath) as! ChooseSizeCVC
            cell = sizeCell
        case colVwRecentReview:
            let reviewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RatingReviewCVC", for: indexPath) as! RatingReviewCVC
            cell = reviewCell
        case colVwRelatedProduct:
            let relatedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedProductCVC", for: indexPath) as! RelatedProductCVC
            cell = relatedCell
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        switch collectionView {
        case colVwBanner:
            size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
        case colVwChooseColor:
            size = CGSize(width: collectionView.frame.size.width/4, height: 40)
        case colVwChooseSize:
            size = CGSize(width: collectionView.frame.size.width/5, height: 40)
        case colVwRecentReview:
            size = CGSize(width: collectionView.frame.size.width/4, height: 75)
        case colVwRelatedProduct:
            size = CGSize(width: collectionView.frame.size.width/2, height: 250)
        default:
            break
        }
        return size
    }
   
}
