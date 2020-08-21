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

class NewsListVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var collectionVwNews: UICollectionView!
    @IBOutlet weak var tblVwList: UITableView!
    
    //MARK:- Variable
    var objNewsListVM = NewsListVM()
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerCollViewNib(collectionVwNews, identifierCell: "NewsListCVC")
        Proxy.shared.registerNib(tblVwList, identifierCell: "NewsListTVC")
        Proxy.shared.registerNib(tblVwList, identifierCell: "NewsListHeaderTVC")
    }
    
    //MARK:- Actions
    @IBAction func actionBack(_ sender: UIButton) {
        popToBack()
    }
}
