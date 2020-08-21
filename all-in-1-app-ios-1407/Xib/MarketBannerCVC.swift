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

class MarketBannerCVC: UICollectionViewCell {
    @IBOutlet weak var imgVwBanner: UIImageView!
}

class MarketExploreCVC: UICollectionViewCell {
    @IBOutlet weak var imgVwExplore: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
}

class MarketTrendingCVC: UICollectionViewCell {
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgVwTrending: UIImageView!
}
