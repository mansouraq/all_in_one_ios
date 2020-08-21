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

import Foundation
import UIKit

class SelectTypeVM : NSObject{
    
    //MARK:- Variable
    var arrTitle = ["Shopping","Health","Game","Finance","All In One Apps"]
    var arrImages = [#imageLiteral(resourceName: "shopping"),#imageLiteral(resourceName: "health"),#imageLiteral(resourceName: "game"),#imageLiteral(resourceName: "finance"),#imageLiteral(resourceName: "ic_allin1")]
    var timer: Timer?
    var changeImageCounter = 0
}

extension SelectTypeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objSelectTypeVM.arrTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseBannerCVC", for: indexPath) as! ChooseBannerCVC
        cell.imgVwType.image = objSelectTypeVM.arrImages[indexPath.row]
        cell.lblTitle.text = objSelectTypeVM.arrTitle[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: colVwType.contentOffset, size: colVwType.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = colVwType.indexPathForItem(at: visiblePoint)
        pageControlBanner.currentPage = indexPath?.row ?? 0
    }
}
