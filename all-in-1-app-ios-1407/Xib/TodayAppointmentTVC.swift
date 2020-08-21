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

class TodayAppointmentTVC: UITableViewCell {
    @IBOutlet weak var btnTick: UIButton!
    @IBOutlet weak var lblFromTime: UILabel!
    @IBOutlet weak var lblToTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgVwAppoint: RoundedImage!
}
class MyLifeHeaderTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnViewAll: UILabel!
}
class MyLifeFooterTVC: UITableViewCell {
    @IBOutlet weak var btnAddAppointment: UIButton!
}
class TodayTodoTVC: UITableViewCell {
    @IBOutlet weak var vwLine: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var btnTick: UIButton!
}
class MyDreamsTVC: UITableViewCell {
    @IBOutlet weak var imgVwDream: UIImageView!
    @IBOutlet weak var progressBarDream: UIProgressView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
}
class StoryTVC: UITableViewCell {
    
    @IBOutlet weak var btnHeart: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgVwStory: UIImageView!
}
class TodayPositivityTVC: UITableViewCell {
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgVwPositivity: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
}
