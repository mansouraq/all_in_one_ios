
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
class SportsVM{
    //MARK: - Variables
    var arrImgTitle = [("bitmap-1","bitmap-1","bitmap-1"),("bitmap-1","bitmap-1","bitmap-1"),("bitmap-1","bitmap-1","bitmap-1"),("bitmap-1","bitmap-1","bitmap-1"),("bitmap-1","bitmap-1","bitmap-1")]
}

extension SportsVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objSportsVM.arrImgTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportsTVC") as! SportsTVC
        cell.imgVwSports.image = UIImage(named: objSportsVM.arrImgTitle[indexPath.item].0)
        cell.imgVw.image = UIImage(named: objSportsVM.arrImgTitle[indexPath.item].1)
        cell.imgVw1.image = UIImage(named: objSportsVM.arrImgTitle[indexPath.item].2)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
