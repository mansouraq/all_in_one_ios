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

class CartListTVC: UITableViewCell {
    @IBOutlet weak var btnTick: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnAddNote: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    @IBOutlet weak var vwLine: UIView!
    @IBOutlet weak var lblQuantityCount: UILabel!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgVwOrder: UIImageView!
}
class CartListVipTVC: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnVipSeller: UIButton!
    @IBOutlet weak var btnTick: UIButton!
}
