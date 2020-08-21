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

class OrderListVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwOrderCategory: UICollectionView!
    @IBOutlet weak var tblVwPayment: UITableView!
    @IBOutlet weak var colVwPayment: UICollectionView!
    
    //MARK:- Objects
    var objOrderListVM = OrderListVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        colVwPayment.reloadData()
    }
    
    //MARK:- IBActions
    @IBAction func actionSearch(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
    }
}
