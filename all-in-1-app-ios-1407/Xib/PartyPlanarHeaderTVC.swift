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

class PartyPlanarHeaderTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
}

class PartyPlanarCategoryTVC: UITableViewCell {
    @IBOutlet weak var colVwCategory: UICollectionView!
    
    var arrCat = ["Catering","Wedding","Venue","Photography","Videography","Dance & Choreo","Decoration & Lighting","Entertainment (DJ)","Entertainment (MC)","KIds Party"]
    var arrCatImg = [#imageLiteral(resourceName: "group4-1"),#imageLiteral(resourceName: "group5-1"),#imageLiteral(resourceName: "group6"),#imageLiteral(resourceName: "group9"),#imageLiteral(resourceName: "group8"),#imageLiteral(resourceName: "group7"),#imageLiteral(resourceName: "group12-4"),#imageLiteral(resourceName: "group11-1"),#imageLiteral(resourceName: "group10"),#imageLiteral(resourceName: "group13")]
    
    func reloadData() {
        colVwCategory.delegate = self
        colVwCategory.dataSource = self
        colVwCategory.reloadData()
    }
}

extension PartyPlanarCategoryTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketExploreCVC", for: indexPath) as! MarketExploreCVC
        cell.lblTitle.text = arrCat[indexPath.row]
        cell.imgVwExplore.image = arrCatImg[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3.5, height: 160)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
