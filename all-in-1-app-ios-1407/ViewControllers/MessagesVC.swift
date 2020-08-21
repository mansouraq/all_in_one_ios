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

class MessagesVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var collectionVwMessages: UICollectionView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var tblVwMessages: UITableView!
    @IBOutlet weak var lblGroups: UILabel!
    @IBOutlet weak var lblMessages: UILabel!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerNib(tblVwMessages, identifierCell: "MessagesTVC")
    }
    //MARK:- IBActions
    @IBAction func btnActnMessages(_ sender: Any)
    {
        lblGroups.isHidden = true
        lblMessages.isHidden = false
    }
    @IBAction func btnActnGroups(_ sender: Any) {
        lblMessages.isHidden = true
        lblGroups.isHidden = false
    }
    @IBAction func btnActnRequest(_ sender: Any) {
        lblGroups.isHidden = true
        lblMessages.isHidden = true
    }
    @IBAction func btnActnBck(_ sender: Any) {
    }
}
