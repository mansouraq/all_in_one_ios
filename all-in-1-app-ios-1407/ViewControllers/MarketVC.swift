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

class MarketVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwBanner: UICollectionView!
    @IBOutlet weak var tblVwMarket: UITableView!
    @IBOutlet weak var txtFldSearch: UITextField!
    @IBOutlet weak var pageControlBanner: UIPageControl!
    
    //MARK:- Object
    var objMarketVM = MarketVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblVwMarket.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        objMarketVM.scrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.scrollAutomatically), userInfo: nil, repeats: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        objMarketVM.scrollTimer.invalidate()
    }
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        RootControllerProxy.shared.rootWithDrawer("MainTBC")
    }
    @IBAction func actionLike(_ sender: Any) {
        pushToNext(FavouriteVC.className)
    }
    @objc func scrollAutomatically(_ timer1: Timer) {
        if objMarketVM.index < 3 {
            let indexPath = IndexPath(item: objMarketVM.index, section: 0)
            colVwBanner.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            objMarketVM.index = objMarketVM.index + 1
            pageControlBanner.currentPage = indexPath.row
        } else {
            objMarketVM.index = 0
            colVwBanner.scrollToItem(at: IndexPath(item: 0, section: 0), at: .centeredHorizontally, animated: true)
            pageControlBanner.currentPage = objMarketVM.index
        }
    }
}
