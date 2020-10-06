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

class StoreCategoryVM: NSObject {
    
}

extension StoreCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        switch collectionView {
        case colVwCategory:
            let catCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCategoryCVC", for: indexPath) as! StoreCategoryCVC
            cell = catCell
        case colVwList:
            if indexPath.row == 0 {
                let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCategoryHeaderCVC", for: indexPath) as! StoreCategoryHeaderCVC
                cell = headerCell
            } else  {
                let listCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCategoryListCVC", for: indexPath) as! StoreCategoryListCVC
                cell = listCell
            }
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGSize()
        switch collectionView {
        case colVwCategory:
             size = CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width-10)
        case colVwList:
            if indexPath.row == 0 {
                size = CGSize(width: collectionView.frame.size.width, height: 112)
            } else {
                size = CGSize(width: collectionView.frame.size.width/2-10, height: 160)
            }
        default:
            break
        }
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == colVwList {
            return 10
        } else {
           return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushToNext(SortFilterVC.className)
    }
}
