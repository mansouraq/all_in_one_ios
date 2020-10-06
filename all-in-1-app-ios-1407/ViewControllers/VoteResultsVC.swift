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

class VoteResultsVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwVote: UITableView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var lblTime: UILabel!
    
    //AMRK:- Object
    var objVoteResultsVM = VoteResultsVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionDownload(_ sender: Any) {
    }
    @IBAction func actionShare(_ sender: Any) {
    }
}
