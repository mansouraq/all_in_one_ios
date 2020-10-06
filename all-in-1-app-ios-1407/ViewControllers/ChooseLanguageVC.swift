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

class ChooseLanguageVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var pageControlBanner: UIPageControl!
    @IBOutlet weak var colVwBanner: UICollectionView!
    
    //MARK:- Variable
    var arrTitle = ["Friend","Health","Finance","Shopping","All In One Apps"]
    var arrImages = [#imageLiteral(resourceName: "1Primary"),#imageLiteral(resourceName: "health"),#imageLiteral(resourceName: "finance-1"),#imageLiteral(resourceName: "shopping"),#imageLiteral(resourceName: "ic_allin1")]
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createAttributeString()
        pageControlBanner.numberOfPages = arrTitle.count
    }
    
    //MARK:- IBActions
    @IBAction func actionEnglish(_ sender: Any) {
        pushToNext(ChooseBirthdayVC.className)
    }
    @IBAction func actionArabic(_ sender: Any) {
        pushToNext(ChooseBirthdayVC.className)
    }
    private func createAttributeString(){
        
        let attributedString = NSMutableAttributedString(string: "You are about face a new experience", attributes: [
            
            .font: UIFont(name: FontName.regular, size: 14.5)!,
            
            .foregroundColor:  Color.dustyOrange
            
        ])
        
        let attributedStringTwo = NSAttributedString(string: " like never before take a deep breath and press the button", attributes:
            [
                
                .font: UIFont(name: FontName.regular, size: 14.5)!,
                
                .foregroundColor:  UIColor.black
                
        ])
        
        attributedString.append(attributedStringTwo)
        lblTitle.attributedText = attributedString
    }
}

extension ChooseLanguageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChooseBannerCVC", for: indexPath) as! ChooseBannerCVC
        cell.imgVwType.image = arrImages[indexPath.row]
        cell.lblTitle.text = arrTitle[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: colVwBanner.contentOffset, size: colVwBanner.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        let indexPath = colVwBanner.indexPathForItem(at: visiblePoint)
        pageControlBanner.currentPage = indexPath?.row ?? 0
    }
}
