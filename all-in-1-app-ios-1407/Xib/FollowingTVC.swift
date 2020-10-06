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

class FollowingTVC: UITableViewCell {
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var colVwFollowing: UICollectionView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgVwStore: UIImageView!
    
    var indexVal = Int()
    
    func reloadData(_ index: Int) {
        indexVal = index
        colVwFollowing.delegate = self
        colVwFollowing.dataSource = self
        colVwFollowing.reloadData()
    }
}

extension FollowingTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FollowingCVC", for: indexPath) as! FollowingCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexVal == 0 {
            return CGSize(width: collectionView.frame.size.width/2, height: 182)
        } else {
            return CGSize(width: collectionView.frame.size.width, height: 182)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
