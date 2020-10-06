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

class StoreVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwStore: UITableView!
    @IBOutlet weak var txtFldSearchStore: UITextField!
    @IBOutlet weak var colVwBannerStore: UICollectionView!
    @IBOutlet weak var pageControlStore: UIPageControl!
    
    //MARK:- Objects
    var objStoreVM = StoreVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        objStoreVM.scrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        objStoreVM.scrollTimer.invalidate()
    }
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionLike(_ sender: Any) {
         pushToNext(FavouriteVC.className)
    }
    @objc func scrollAutomatically(_ timer1: Timer) {
        if objStoreVM.index < 3 {
            let indexPath = IndexPath(item: objStoreVM.index, section: 0)
            colVwBannerStore.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            objStoreVM.index = objStoreVM.index + 1
            pageControlStore.currentPage = indexPath.row
        } else {
            objStoreVM.index = 0
            colVwBannerStore.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            pageControlStore.currentPage = objStoreVM.index
        }
    }
}
