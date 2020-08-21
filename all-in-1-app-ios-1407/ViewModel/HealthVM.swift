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

class HealthVM : NSObject {
    var dailyMacros = [("Carbs",""),("Protein",""),("Fat","")]
}

extension HealthVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collVwDailyMacros:
            return 3
        case collVwExercise:
            return 5
        case collVwMealLogs:
            return 6
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForRowAt indexpath: IndexPath)-> CGFloat {
        switch collectionView {
        case collVwDailyMacros:
            return 76
        case collVwExercise:
            return 76
        case collVwMealLogs:
            return 76
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwDailyMacros{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyMacrosCVC",for: indexPath as IndexPath) as! DailyMacrosCVC
            return cell
        } else if collectionView == collVwExercise{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HealthExerciseCVC",for: indexPath as IndexPath) as! HealthExerciseCVC
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HealthMealCVC",for: indexPath as IndexPath) as! HealthMealCVC
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collVwDailyMacros{
            return CGSize(width: collectionView.frame.size.width/3, height: 76)
        }else if collectionView == collVwExercise{
            return CGSize(width: 152, height: 76)
        }else{
            return CGSize(width: 152, height: 76)
        }
    }
}
