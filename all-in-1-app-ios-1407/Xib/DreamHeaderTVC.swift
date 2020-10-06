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

class DreamHeaderTVC: UITableViewCell {
    @IBOutlet weak var imgVwDream: UIImageView!
    @IBOutlet weak var imgVwDrop: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnSection: UIButton!
    @IBOutlet weak var progressBarDream: UIProgressView!
    @IBOutlet weak var vwBg: UIView!
}
class DreamTVC: UITableViewCell {
    @IBOutlet weak var imgVwTick: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var vwBg: UIView!
}
