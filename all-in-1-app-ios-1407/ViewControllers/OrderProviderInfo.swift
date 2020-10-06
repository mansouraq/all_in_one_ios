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

class OrderProviderInfo: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imgVwProvider: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var btnRating: UIButton!
    @IBOutlet weak var vwProfessionalRating: FloatRatingView!
    @IBOutlet weak var vwTimeRating: FloatRatingView!
    @IBOutlet weak var vwExperienceRating: FloatRatingView!
    @IBOutlet weak var vwValueRating: FloatRatingView!
    @IBOutlet weak var colVwInfo: UICollectionView!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var vwReviewRating: FloatRatingView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblReviewerName: UILabel!
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionAllReviews(_ sender: Any) {
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionSelectOrder(_ sender: Any) {
    }
}

