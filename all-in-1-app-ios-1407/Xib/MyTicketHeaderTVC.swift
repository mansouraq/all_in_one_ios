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

class MyTicketHeaderTVC: UITableViewCell {
    @IBOutlet weak var imgVwTicket: UIImageView!
    @IBOutlet weak var lblBookingId: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
}

class MyTicketTVC: UITableViewCell {
    @IBOutlet weak var vwBg: UIView!
    @IBOutlet weak var vwLeftBg: RoundedView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var vwRightBg: RoundedView!
    @IBOutlet weak var btnViewTicket: UIButton!
}
