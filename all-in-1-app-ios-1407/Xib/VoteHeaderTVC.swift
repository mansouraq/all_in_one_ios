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

class VoteHeaderTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
}
class VoteAnswerTVC: UITableViewCell {
    @IBOutlet weak var imgVwTick: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwBg: UIView!
}
class VotePercentageTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var vwBg: UIView!
    @IBOutlet weak var lblPercent: UILabel!
}
