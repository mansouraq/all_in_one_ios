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

class DueTodayTaskVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tblVwList: UITableView!
    @IBOutlet weak var vwCalendar: FSCalendar!
    @IBOutlet weak var vwCalendarHeightCnst: NSLayoutConstraint!
    
    //MARK:- Variable
    var objDueTaskTodayVM = DueTaskTodayVM()
    
    //MARK:- Life cycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        vwCalendar.appearance.borderRadius = 0.4
        vwCalendar.setScope(.week, animated: true)
        vwCalendarHeightCnst.constant = 230
    }
    
    //MARK:- Button actions
    @IBAction func actionBack(_ sender: UIButton) {
        popToBack()
    }
    
    @IBAction func actionAdd(_ sender: Any) {
        presentVC(identifier: "AddTodoPopupVC", animate: true)
    }
}
