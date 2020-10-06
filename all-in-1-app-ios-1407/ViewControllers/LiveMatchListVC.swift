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

class LiveMatchListVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwLiveScore: UICollectionView!
    @IBOutlet weak var colVwLiveCategory: UICollectionView!
    @IBOutlet weak var tblVwLive: UITableView!
    
    //MARK:- Object
    var objLiveMatchListVM = LiveMatchListVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionShare(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
