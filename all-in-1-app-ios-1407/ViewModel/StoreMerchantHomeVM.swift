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

class StoreMerchantHomeVM: NSObject {
    
    //MARK:- Variables
    var selectedValue = Int()
}

extension StoreMerchantHomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            if objStoreMerchantHomeVM.selectedValue == 2 {
                return 2
            } else {
                return 1
            }
        } else {
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            if objStoreMerchantHomeVM.selectedValue == 0 {
                let homeCell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantHomeTVC") as! StoreMerchantHomeTVC
                homeCell.reloadData()
                cell = homeCell
            } else if objStoreMerchantHomeVM.selectedValue == 1 {
                let filterCell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantFilterTVC") as! StoreMerchantFilterTVC
                filterCell.reloadData()
                cell = filterCell
            } else {
                let ratingCell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantReviewTVC") as! StoreMerchantReviewTVC
                cell = ratingCell
            }
        case 1:
            if objStoreMerchantHomeVM.selectedValue == 2 {
                let ratingListCell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantRatingListTVC") as! StoreMerchantRatingListTVC
                ratingListCell.reloadData()
                cell = ratingListCell
            } else {
                let productCell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantProductTVC") as! StoreMerchantProductTVC
                productCell.reloadData()
                cell = productCell
            }
            
        default:
            let homeCell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantHomeTVC") as! StoreMerchantHomeTVC
            homeCell.reloadData()
            cell = homeCell
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerCell = UIView()
        switch section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantBannerTVC") as! StoreMerchantBannerTVC
            cell.reloadData()
            cell.btnHome.tag = section
            cell.btnHome.addTarget(self, action: #selector(actionHome), for: .touchUpInside)
            cell.btnReview.tag = section
            cell.btnReview.addTarget(self, action: #selector(actionReview), for: .touchUpInside)
            cell.btnProduct.tag = section
            cell.btnProduct.addTarget(self, action: #selector(actionProduct), for: .touchUpInside)
            cell.btnHome.isSelected = objStoreMerchantHomeVM.selectedValue == 0
            cell.btnProduct.isSelected = objStoreMerchantHomeVM.selectedValue == 1
            cell.btnReview.isSelected = objStoreMerchantHomeVM.selectedValue == 2
            headerCell = cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreMerchantHeaderTVC") as! StoreMerchantHeaderTVC
            cell.lblTitle.text = objStoreMerchantHomeVM.selectedValue == 0 ? "Top Seller Product" : "Reviews"
            headerCell = cell
        default:
            break
        }
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if objStoreMerchantHomeVM.selectedValue == 0 {
                return 220
            } else if objStoreMerchantHomeVM.selectedValue == 1 {
                return 60
            } else {
                return 150
            }
        } else {
            if objStoreMerchantHomeVM.selectedValue == 2 {
                return 250
            } else {
                return 780
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var headerSize = CGFloat()
        switch section {
        case 0:
            headerSize = 310
        case 1:
            headerSize = objStoreMerchantHomeVM.selectedValue == 0 || objStoreMerchantHomeVM.selectedValue == 2 ? 60 : 0
        default:
            break
        }
        return headerSize
    }
    @objc func actionHome() {
        objStoreMerchantHomeVM.selectedValue = 0
        tblVwStoreMerchant.reloadData()
    }
    @objc func actionProduct() {
        objStoreMerchantHomeVM.selectedValue = 1
        tblVwStoreMerchant.reloadData()
    }
    @objc func actionReview() {
        objStoreMerchantHomeVM.selectedValue = 2
        tblVwStoreMerchant.reloadData()
    }
}
