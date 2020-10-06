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

class ShopVC: UIViewController {

    @IBOutlet weak var collVwCategory: UICollectionView!
    @IBOutlet weak var collVwTrending: UICollectionView!
    @IBOutlet weak var collVwProperty: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
      Proxy.shared.registerCollViewNib(collVwCategory, identifierCell: "CategoryCVC")
      Proxy.shared.registerCollViewNib(collVwTrending, identifierCell: "TrendingCVC")
      Proxy.shared.registerCollViewNib(collVwProperty, identifierCell: "PropertySaleCVC")
    }
}
