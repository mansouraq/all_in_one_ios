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

class StoreVM: NSObject {
    
    //MARK:- Variables
    var arrStore = ["Top Category","Top Store","Top Seller Product"]
    var scrollTimer = Timer()
    var index = 1
}
extension StoreVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objStoreVM.arrStore.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let catCell = tableView.dequeueReusableCell(withIdentifier: "TopCategoryTVC") as! TopCategoryTVC
            catCell.reloadData()
            cell = catCell
        case 1:
            let storeCell = tableView.dequeueReusableCell(withIdentifier: "TopStoreTVC") as! TopStoreTVC
            storeCell.reloadData()
            cell = storeCell
        case 2:
            let sellerCell = tableView.dequeueReusableCell(withIdentifier: "TopSellerTVC") as! TopSellerTVC
            sellerCell.reloadData()
            cell = sellerCell
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "MarketHeaderTVC") as! MarketHeaderTVC
        headerCell.lblTitle.text = objStoreVM.arrStore[section]
        if section == 0 {
            headerCell.btnSeeAll.tag = section
            headerCell.btnSeeAll.addTarget(self, action: #selector(actionSeeAll), for: .touchUpInside)
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size = CGFloat()
        switch indexPath.section {
        case 0:
            size = 165
        case 1:
            size = 130
        case 2:
            size = 250
        default:
            break
        }
        return size
    }
    @objc func actionSeeAll () {
        pushToNext(StoreCategoryVC.className)
    }
}
extension StoreVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketBannerCVC", for: indexPath) as! MarketBannerCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = colVwBannerStore.contentOffset
        visibleRect.size = colVwBannerStore.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = colVwBannerStore.indexPathForItem(at: visiblePoint) else { return }
        pageControlStore.currentPage = indexPath.row
    }
}
