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

class ProductDetailBannerCVC: UICollectionViewCell {
    @IBOutlet weak var imgVwBanner: UIImageView!
}

class ChooseColorCVC: UICollectionViewCell {
    @IBOutlet weak var vwBg: RoundedView!
    @IBOutlet weak var vwSelectedColor: RoundedView!
    @IBOutlet weak var lblTitle: UILabel!
}
class ChooseSizeCVC: UICollectionViewCell {
    @IBOutlet weak var vwBg: RoundedView!
    @IBOutlet weak var lblTitle: UILabel!
}
class RatingReviewCVC: UICollectionViewCell {
    @IBOutlet weak var imgVwReview: UIImageView!
}
class RelatedProductCVC: UICollectionViewCell {
    @IBOutlet weak var imgVwStore: RoundedImage!
    @IBOutlet weak var imgVwProduct: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var imgVwStoreName: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
}
