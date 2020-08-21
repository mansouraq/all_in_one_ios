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

class AddAppointmentPopupVM: NSObject {
    
    //MARK:- Variables
    var arrAppointment = [("Date & Time",#imageLiteral(resourceName: "ic_clock")),("Priority",#imageLiteral(resourceName: "ic_orangerange")),("Repeat",#imageLiteral(resourceName: "ic_repeat")),("Share With",#imageLiteral(resourceName: "ic_add")),("Reminder",#imageLiteral(resourceName: "ic_clock")),("Add Note",#imageLiteral(resourceName: "ic_clock"))]
}

extension AddAppointmentPopupVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = txtFldAddAppointment.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            vwLine.backgroundColor =  updatedText.count != 0 ? Color.dustyOrange : Color.lightGreyText
        }
        return true
    }
}
extension AddAppointmentPopupVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddAppointmentCVC", for: indexPath) as! AddAppointmentCVC
        cell.imgVwType.image = objAddAppointmentPopupVM.arrAppointment[indexPath.row].1
        cell.lblTitle.text = objAddAppointmentPopupVM.arrAppointment[indexPath.row].0
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let controller = mainStoryboard.instantiateViewController(withIdentifier: "ChooseDateTimeVC") as! ChooseDateTimeVC
            controller.objPassDate = { (date,title) in
                self.vwDateHeightCnst.constant = 50
                self.vwDateTime.isHidden = false
                let date = date.stringFromFormat("YYYY MM dd HH:mm:ss")
                self.btnShowDateTime.setTitle(date, for: .normal)
                
                self.colVwAppointment.reloadData()
            }
            self.present(controller, animated: true, completion: nil)
        default:
            break
        }
    }
}
