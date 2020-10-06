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

class AddShippingAddressTVC: UITableViewCell {
    @IBOutlet weak var btnChange: UIButton!
}

class CheckoutStoreTVC: UITableViewCell {
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var lblFollowerCount: UILabel!
    @IBOutlet weak var imgVwStore: UIImageView!
}
class CheckoutProductTVC: UITableViewCell {
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgVwProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
}
class PayWithWalletTVC: UITableViewCell {
}
class CheckoutAddressTVC: UITableViewCell {
    @IBOutlet weak var lblAddressType: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
}
class CheckoutTotalTVC: UITableViewCell {
    @IBOutlet weak var btnAmount: UIButton!
}
class AddShippingMethodTVC: UITableViewCell {
}
class OrderOverviewTVC: UITableViewCell {
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTax: UILabel!
    @IBOutlet weak var lblShippingCharges: UILabel!
    @IBOutlet weak var lblPaypalFee: UILabel!
}
class CheckoutShippingMethodTVC: UITableViewCell {
    @IBOutlet weak var lblDeliveryTime: UILabel!
    @IBOutlet weak var lblShippingName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgVwType: UIImageView!
    @IBOutlet weak var imgVwTick: UIImageView!
}
