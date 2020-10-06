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

class AppointmentListVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var vwCalendarHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var vwCalendar: FSCalendar!
    @IBOutlet weak var tblVwAppointmentList: UITableView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        vwCalendar.appearance.borderRadius = 0.4
        vwCalendar.setScope(.week, animated: true)
        vwCalendarHeightCnst.constant = 230
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionAddAppointment(_ sender: Any) {
        presentVC(identifier: AddAppointmentPopupVC.className, animate: true)
    }
}


extension AppointmentListVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let positiceCell = tableView.dequeueReusableCell(withIdentifier: "AppointmentListTVC") as! AppointmentListTVC
        return positiceCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension AppointmentListVC: FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.vwCalendarHeightCnst.constant = bounds.height
        self.view.layoutIfNeeded()
    }
}

