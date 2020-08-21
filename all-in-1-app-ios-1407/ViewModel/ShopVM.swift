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

class ShopVM{
    
}

extension ShopVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collVwCategory:
            return 8
        case collVwTrending:
            return 3
        case collVwProperty:
            return 4
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexpath: IndexPath)-> CGFloat {
        switch collectionView {
        case collVwCategory:
            return 100
        case collVwTrending:
            return 170
        case collVwProperty:
            return 215
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collVwCategory{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCVC",for: indexPath as IndexPath) as! CategoryCVC
            return cell
        }else if collectionView == collVwTrending{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrendingCVC",for: indexPath as IndexPath) as! TrendingCVC
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PropertySaleCVC",for: indexPath as IndexPath) as! PropertySaleCVC
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == collVwCategory{
            return CGSize(width: collectionView.frame.size.width/3.5, height: 80)
        }else if collectionView == collVwTrending{
            return CGSize(width: 340, height: 170)
        }else{
            return CGSize(width: 200, height: 215)
        }
    }
}
