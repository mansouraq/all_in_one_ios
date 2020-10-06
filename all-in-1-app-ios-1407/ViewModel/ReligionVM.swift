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

class ReligionVM {
    //MARK: - Variables
    var arrImgTitle = [("quran","Quran"),("athqar","Athkar"),("mosqueFinder","Mosque Finder")]
 }

extension ReligionVC: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objReligionVM.arrImgTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReligionTVC") as! ReligionTVC
        cell.lblReligionNm.text = objReligionVM.arrImgTitle[indexPath.item].1
        cell.imgVwReligion.image = UIImage(named: objReligionVM.arrImgTitle[indexPath.item].0)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            return 150
        }else{
            return 110
        }
        
    }
}
