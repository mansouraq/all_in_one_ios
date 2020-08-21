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
class NewsDetailsVM : NSObject {
    
    //MARK:- Variable
    var arrTags = ["Politics","Health","Journalism"]
}
extension NewsDetailsVC: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    //MARK:- CollectionView Method
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionVwNews{
            return 5
        }else{
            return objNewsDetailsVM.arrTags.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionVwNews{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsListOnTheSpotCVC",for: indexPath as IndexPath) as! NewsListOnTheSpotCVC
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewsDetailsTagsCVC",for: indexPath as IndexPath) as! NewsDetailsTagsCVC
            cell.lblTitle.text! = objNewsDetailsVM.arrTags[indexPath.item]
            return cell
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           if collectionView == collectionVwNews{
            return CGSize(width: collectionVwNews.frame.width/2.5 , height: 200)
           }else{
               return CGSize(width: 60 , height: 50)
           }
       }
}
