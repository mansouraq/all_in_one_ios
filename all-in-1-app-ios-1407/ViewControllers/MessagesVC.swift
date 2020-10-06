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
    @IBOutlet weak var vwStoryHeigthCnst: NSLayoutConstraint!
    @IBOutlet weak var vwStory: UIView!
    
    //MARK:- Object
    var objMessagesVM = MessagesVM()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerNib(tblVwMessages, identifierCell: "MessagesTVC")
        Proxy.shared.registerNib(tblVwMessages, identifierCell: "FriendRequestHeaderTVC")
        Proxy.shared.registerNib(tblVwMessages, identifierCell: "RequestTVC")
        Proxy.shared.registerNib(tblVwMessages, identifierCell: "PeopleYouKnowTVC")
    }
    //MARK:- IBActions
    @IBAction func btnActnMessages(_ sender: Any) {
        lblGroups.isHidden = true
        lblMessages.isHidden = false
        vwStory.isHidden = false
        vwStoryHeigthCnst.constant = 113
        objMessagesVM.selectedType = 0
        tblVwMessages.reloadData()
    }
    @IBAction func btnActnGroups(_ sender: Any) {
        lblMessages.isHidden = true
        lblGroups.isHidden = false
        vwStory.isHidden = false
        vwStoryHeigthCnst.constant = 113
        objMessagesVM.selectedType = 1
        tblVwMessages.reloadData()
    }
    @IBAction func btnActnRequest(_ sender: Any) {
        lblGroups.isHidden = true
        lblMessages.isHidden = true
        vwStory.isHidden = true
        vwStoryHeigthCnst.constant = 0
        objMessagesVM.selectedType = 2
        tblVwMessages.reloadData()
    }
    @IBAction func btnActnBck(_ sender: Any) {
    }
}
