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

class PreferencesVM: NSObject {
    
    var arrMain = [String]()
    var arrEntertainment = ["Celebrities","Music","Travel","Politics","Economy","Sports"]
    var arrSports = ["Go Gym","Eat Healthy","To Busy","Pizza"]
    var arrHobbies = ["Book","Story","Movies","Podcast"]
    var arrYourSelf = ["Extrovert","Introvert"]
    var arrWeather = ["Sunrise","Sunset"]
    var currentIndex = Int()
    var arrEntertainmentImg = [#imageLiteral(resourceName: "undrawCityDriverJh2H"),#imageLiteral(resourceName: "undrawComposeMusicOvo2"),#imageLiteral(resourceName: "undrawDepartingLsgy"),#imageLiteral(resourceName: "undrawCandidateUbwv"),#imageLiteral(resourceName: "undrawInvesting7U74"),#imageLiteral(resourceName: "undrawFitnessStatsSht6")]
    var arrSportsImg = [#imageLiteral(resourceName: "undrawHealthyHabitBh5W"),#imageLiteral(resourceName: "undrawBreakfastPsiw"),#imageLiteral(resourceName: "undrawBusinessman97X4"),#imageLiteral(resourceName: "foodAndRestaurant")]
    var arrHobbiesImg = [#imageLiteral(resourceName: "undrawBookLoverMkck"),#imageLiteral(resourceName: "undrawBibliophileHwqc"),#imageLiteral(resourceName: "undrawNetflixQ00O"),#imageLiteral(resourceName: "undrawPodcastQ6P7")]
    var arrYourselfImg = [#imageLiteral(resourceName: "undrawMissedChancesK3Cq"),#imageLiteral(resourceName: "undrawMissedChancesK3Cq")]
    var arrWeatherImg = [#imageLiteral(resourceName: "ic_v8"),#imageLiteral(resourceName: "ic_v9")]
    var selectedIndex = Int()
}

extension PreferencesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return objPreferencesVM.arrMain.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreferencesCVC.className, for: indexPath) as! PreferencesCVC
        cell.vwBg.layer.borderColor = objPreferencesVM.selectedIndex == indexPath.row ? Color.dustyOrange.cgColor : UIColor.lightGray.cgColor
        cell.imgVwTick.isHidden = objPreferencesVM.selectedIndex != indexPath.row
        cell.lblTitle.text = objPreferencesVM.arrMain[indexPath.row]
        switch objPreferencesVM.currentIndex {
        case 0:
            cell.imgVwPreferences.image = objPreferencesVM.arrEntertainmentImg[indexPath.row]
        case 1:
            cell.imgVwPreferences.image = objPreferencesVM.arrSportsImg[indexPath.row]
        case 2:
            cell.imgVwPreferences.image = objPreferencesVM.arrWeatherImg[indexPath.row]
        case 3:
            cell.imgVwPreferences.image = objPreferencesVM.arrYourselfImg[indexPath.row]
        case 4:
            cell.imgVwPreferences.image = objPreferencesVM.arrHobbiesImg[indexPath.row]
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if objPreferencesVM.currentIndex == 2 || objPreferencesVM.currentIndex == 3 {
            return CGSize(width: (collectionView.frame.size.width-50)/2 , height: 280)
        } else {
            return CGSize(width: (collectionView.frame.size.width-40)/2, height: 180)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        objPreferencesVM.selectedIndex = indexPath.row
        colVwPreferences.reloadData()
    }
}
