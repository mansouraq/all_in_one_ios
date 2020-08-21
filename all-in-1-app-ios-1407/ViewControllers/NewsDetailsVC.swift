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

class NewsDetailsVC: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var collectionVwNews: UICollectionView!
    @IBOutlet weak var collectionVwTags: UICollectionView!
    
    //MARK:- variable
    var objNewsDetailsVM = NewsDetailsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerCollViewNib(collectionVwNews, identifierCell: "NewsListOnTheSpotCVC")
        Proxy.shared.registerCollViewNib(collectionVwTags, identifierCell: "NewsDetailsTagsCVC")
    }
    //MARK:- Actions
    @IBAction func actionBack(_ sender: UIButton) {
        popToBack()
    }
}
