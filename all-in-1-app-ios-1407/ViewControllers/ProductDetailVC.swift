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

class ProductDetailVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwBanner: UICollectionView!
    @IBOutlet weak var txtFldSearchProduct: UITextField!
    @IBOutlet weak var pageControlBanner: UIPageControl!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSold: UILabel!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var btnStarRating: UIButton!
    @IBOutlet weak var imgVwStore: RoundedImage!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var vwRating: UIView!
    @IBOutlet weak var lblReviewComment: UILabel!
    @IBOutlet weak var colVwRelatedProduct: UICollectionView!
    @IBOutlet weak var colVwRecentReview: UICollectionView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblCustomerReviewCount: UILabel!
    @IBOutlet weak var btnProductReview: UIButton!
    @IBOutlet weak var lblCondition: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblPcs: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var colVwChooseSize: UICollectionView!
    @IBOutlet weak var lblFollowerCount: UILabel!
    @IBOutlet weak var colVwChooseColor: UICollectionView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var lblStoreName: UILabel!
    
    //MARK:- View Life Cycle
    var objProductDetailVM = ProductDetailVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        objProductDetailVM.scrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        objProductDetailVM.scrollTimer.invalidate()
    }
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionCart(_ sender: Any) {
    }
    @IBAction func actionShare(_ sender: Any) {
    }
    @IBAction func actionLikeProduct(_ sender: Any) {
    }
    @IBAction func actionFollowStore(_ sender: Any) {
    }
    @IBAction func actionViewAll(_ sender: Any) {
    }
    @IBAction func actionAddCart(_ sender: Any) {
        presentVC(identifier: RelatedProductPopupVC.className, animate: true)
    }
    @objc func scrollAutomatically(_ timer1: Timer) {
        if objProductDetailVM.index < 3 {
            let indexPath = IndexPath(item: objProductDetailVM.index, section: 0)
            colVwBanner.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            objProductDetailVM.index = objProductDetailVM.index + 1
            pageControlBanner.currentPage = indexPath.row
        } else {
            objProductDetailVM.index = 0
            colVwBanner.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            pageControlBanner.currentPage = objProductDetailVM.index
        }
    }
}
