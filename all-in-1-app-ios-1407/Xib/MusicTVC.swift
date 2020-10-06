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

class MusicTVC: UITableViewCell {
    @IBOutlet weak var colVwMusic: UICollectionView!
    
    var indexVal = Int()
    
    func reloadData(_ sectionIndex: Int) {
        indexVal = sectionIndex
        colVwMusic.dataSource = self
        colVwMusic.delegate = self
        colVwMusic.reloadData()
    }
}

class MusicArtistTVC: UITableViewCell {
    @IBOutlet weak var colVwArtist: UICollectionView!
    
    func reloadData(){
        colVwArtist.dataSource = self
        colVwArtist.delegate = self
        colVwArtist.reloadData()
    }
}
extension MusicTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicCVC.className, for: indexPath) as! MusicCVC
        cell.lblDesc.isHidden = indexVal == 1
        cell.lblDesc.text = indexVal == 0 ? "1.300.231 FOLLOWERS" : "50 songs"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2, height: collectionView.frame.size.height)
    }
}
extension MusicArtistTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MusicArtistCVC.className, for: indexPath) as! MusicArtistCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/4, height: collectionView.frame.size.height)
    }
}
