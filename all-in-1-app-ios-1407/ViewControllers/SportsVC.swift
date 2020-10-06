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

class SportsVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwSports: UITableView!
    
    //MARK:- Variables
    var objSportsVM = SportsVM()
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK:- Actions
    @IBAction func actionBack(_ sender: UIButton) {
        popToBack()
    }
    @IBAction func actionViewAll(_ sender: Any) {
        pushToNext(LiveMatchListVC.className)
    }
}
