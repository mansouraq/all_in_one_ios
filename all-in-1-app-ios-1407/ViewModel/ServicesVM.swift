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

class ServicesVM: NSObject {
    
}

extension ServicesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colVwBannerService {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceBannerCVC", for: indexPath) as! ServiceBannerCVC
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCategoryCVC", for: indexPath) as! ServiceCategoryCVC
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colVwBannerService {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        } else {
            return CGSize(width: collectionView.frame.size.width/2, height: 45)
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = colVwBannerService.contentOffset
        visibleRect.size = colVwBannerService.bounds.size
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        guard let indexPath = colVwBannerService.indexPathForItem(at: visiblePoint) else { return }
        pageControlService.currentPage = indexPath.row
    }
}

extension ServicesVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServicesTVC") as! ServicesTVC
        cell.btnFindProvider.tag = indexPath.row
        cell.btnFindProvider.addTarget(self, action: #selector(actionFindProvider(_ :)), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushToNext(DiscoverVC.className)
    }
    @objc func actionFindProvider(_ sender: UIButton) {
        pushToNext(AvailableProviderVC.className)
    }
}
