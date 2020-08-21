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

class FavouriteVM: NSObject {
    var arrType = ["All","Product","Shop"]
}

extension FavouriteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTVC") as! FavouriteTVC
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
}
extension FavouriteVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objFavouriteVM.arrType.count
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyLifeTypeCVC",for: indexPath as IndexPath) as! MyLifeTypeCVC
        cell.lblTitle.text = objFavouriteVM.arrType[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var stringToFit = String()
        stringToFit =  objFavouriteVM.arrType[indexPath.row]
        let font = UIFont.systemFont(ofSize: 15)
        let userAttributes = [NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor :UIColor.black]
        let size = stringToFit.size(withAttributes: userAttributes)
        let newSize = CGSize(width: size.width+45, height: colVwCategory.frame.height-10)
        return newSize
    }
}
