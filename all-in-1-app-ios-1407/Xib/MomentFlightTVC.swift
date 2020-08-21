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

class MomentFlightTVC: UITableViewCell {

    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var colVwHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var colVwFlight: UICollectionView!
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var btnAllComment: UIButton!
    
    //MARK:- Variables
    var sectionIndex = Int()
    
    func reloadData(_ index: Int){
        sectionIndex = index
        Proxy.shared.registerCollViewNib(colVwFlight, identifierCell: "MomentFlightCVC")
        colVwFlight.delegate = self
        colVwFlight.dataSource = self
        colVwHeightCnst.constant = sectionIndex == 1 ? 100 : 200
        colVwFlight.reloadData()
    }
}


extension MomentFlightTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionIndex == 1 ? 3 : 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MomentFlightCVC", for: indexPath) as! MomentFlightCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sectionIndex == 1 ? CGSize(width: collectionView.frame.size.width/4, height: 90) : CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.width)
    }
}
