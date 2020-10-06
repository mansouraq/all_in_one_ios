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

class MarketVM: NSObject {
    
    //MARK:- Variables
    var arrMarket = ["Explore","Today Trending"]
    var scrollTimer = Timer()
    var index = 1
}
extension MarketVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return objMarketVM.arrMarket.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let exploreCell = tableView.dequeueReusableCell(withIdentifier: "MarketExploreTVC") as! MarketExploreTVC
            exploreCell.reloadData()
            cell = exploreCell
        case 1:
            let trendingCell = tableView.dequeueReusableCell(withIdentifier: "MarketTrendingTVC") as! MarketTrendingTVC
            trendingCell.reloadData()
            cell = trendingCell
        default:
            break
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "MarketHeaderTVC") as! MarketHeaderTVC
        headerCell.lblTitle.text = objMarketVM.arrMarket[section]
        headerCell.btnSeeAll.isHidden = section == 0
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size = CGFloat()
        switch indexPath.section {
        case 0:
            size = 330
        case 1:
            size = 280
        default:
            break
        }
        return size
    }
}
extension MarketVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pushToNext(StoreCategoryVC.className)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = colVwBanner.contentOffset
        visibleRect.size = colVwBanner.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = colVwBanner.indexPathForItem(at: visiblePoint) else { return }
        pageControlBanner.currentPage = indexPath.row
    }
}
