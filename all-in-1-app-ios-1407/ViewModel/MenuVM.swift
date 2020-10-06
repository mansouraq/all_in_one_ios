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

class MenuVM{
    //MARK: - Variables
    var arrImg = ["outlined-1","qr","ic_scan_drwr", "wallet","outlined","icon"]
    var arritems = ["Profile", "My QR Code", "Scan", "Money", "Settings" ,"Help"]
}

extension MenuVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objmenuVM.arrImg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVC") as! MenuTVC
        cell.lblName.text = objmenuVM.arritems[indexPath.item]
        cell.imgVwName.image = UIImage(named: objmenuVM.arrImg[indexPath.item])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var myCurrentVC = UIViewController()
        if let tabBarvC = KAppDelegate.sideMenu.mainViewController as? UINavigationController {
            if let navVc = tabBarvC.visibleViewController as? UITabBarController {
                myCurrentVC = navVc.selectedViewController!
            }
        } else if let viewC = KAppDelegate.sideMenu.mainViewController as? UINavigationController {
            myCurrentVC = viewC
        }
        KAppDelegate.sideMenu.closeLeft()
        if indexPath.row == 3 {
            myCurrentVC.pushToNext(WalletVC.className)
        } else if indexPath.row == 1 {
           myCurrentVC.pushToNext(ScanQrVC.className)
        }
    }
}
