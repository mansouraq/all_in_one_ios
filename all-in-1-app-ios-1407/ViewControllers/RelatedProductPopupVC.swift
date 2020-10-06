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

class RelatedProductPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwCart: UICollectionView!
    @IBOutlet weak var colVwRelatedProducts: UICollectionView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionCross(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension RelatedProductPopupVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == colVwCart ? 1 : 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == colVwCart {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewCartCVC", for: indexPath) as! ViewCartCVC
            cell.btnViewCart.tag = indexPath.row
            cell.btnViewCart.addTarget(self, action: #selector(actionViewCart), for: .touchUpInside)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedProductCVC", for: indexPath) as! RelatedProductCVC
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == colVwCart {
            return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
        } else {
            return CGSize(width: collectionView.frame.size.width/2, height: 250)
        }
    }
    @objc func actionViewCart() {
        RootControllerProxy.shared.rootWithDrawer(TabBarVC.className)
    }
}
