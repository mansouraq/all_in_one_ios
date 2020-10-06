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
import FSCalendar

class DiscoverVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var vwCalendar: FSCalendar!
    @IBOutlet weak var lblProviderCount: UILabel!
    @IBOutlet weak var tblVwDiscover: UITableView!
    @IBOutlet weak var vwCalendarHeightCnst: NSLayoutConstraint!
    
    //MARK:- Object
    var objDiscoverVM = DiscoverVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        vwCalendar.setScope(.week, animated: true)
        vwCalendarHeightCnst.constant = 250
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionFilter(_ sender: Any) {
    }
}
