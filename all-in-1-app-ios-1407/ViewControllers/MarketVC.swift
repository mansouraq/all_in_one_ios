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

class MarketVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwBanner: UICollectionView!
    @IBOutlet weak var tblVwMarket: UITableView!
    
    //MARK:- Object
    var objMarketVM = MarketVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVwMarket.reloadData()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSearch(_ sender: Any) {
    }
}
