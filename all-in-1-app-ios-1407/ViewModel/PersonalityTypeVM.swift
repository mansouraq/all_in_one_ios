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

class PersonalityTypeVM: NSObject {
    
}

extension PersonalityTypeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == colVwPersonality ? 1 : 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colVwPersonality {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalityCVC", for: indexPath) as! PersonalityCVC
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonalityTypeCVC", for: indexPath) as! PersonalityTypeCVC
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView == colVwPersonality ?  CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height) :  CGSize(width: collectionView.frame.size.width/7, height: 128)
    }
}
