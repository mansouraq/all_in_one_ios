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
class YourPersonalityVM {
    var arrMain = [String]()
    var arrGender = [("Male"),("Female")]
    var arrYourSelf = ["Extrovert","Introvert"]
    var arrFeelings  = ["Optimistic","Pessimistic"]
    var arrOrganized = ["Go With Flow","Plan Ahead"]
    var arrPreferences = ["Celebrities","Music"]
    var arrGenderImg = [#imageLiteral(resourceName: "male"),#imageLiteral(resourceName: "female")]
    var arrYourselfImg = [#imageLiteral(resourceName: "undrawMissedChancesK3Cq"),#imageLiteral(resourceName: "undrawMissedChancesK3Cq")]
    var arrFeelingsImg = [#imageLiteral(resourceName: "undrawLogicN6Th1"),#imageLiteral(resourceName: "undrawArt0Tat")]
    var arrOrganizedImg = [#imageLiteral(resourceName: "undrawInRealLifeV8Fk2"),#imageLiteral(resourceName: "undrawMobileFeed73Bd")]
    var arrPreferencesImg = [#imageLiteral(resourceName: "undrawSourceCodeXx2E"),#imageLiteral(resourceName: "undrawSelecting1Lx3")]
    var currentIndex = Int()
    var selectedIndex = Int()
}

extension YourPersonalityVC: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objYourPersonalityVM.arrMain.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: InfoCVC.className, for: indexPath) as! InfoCVC
        cell.vwBg.layer.borderColor = objYourPersonalityVM.selectedIndex == indexPath.row ? Color.dustyOrange.cgColor : UIColor.lightGray.cgColor
        cell.imgVwTick.isHidden = objYourPersonalityVM.selectedIndex != indexPath.row
        cell.lblTitle.text = objYourPersonalityVM.arrMain[indexPath.row]
        switch objYourPersonalityVM.currentIndex {
        case 0:
            cell.imgVwPersonality.image = objYourPersonalityVM.arrGenderImg[indexPath.row]
        case 1:
            cell.imgVwPersonality.image = objYourPersonalityVM.arrFeelingsImg[indexPath.row]
        case 2:
            cell.imgVwPersonality.image = objYourPersonalityVM.arrOrganizedImg[indexPath.row]
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width-50)/2 , height: 280)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        objYourPersonalityVM.selectedIndex = indexPath.row
        collViewInfo.reloadData()
    }
}
