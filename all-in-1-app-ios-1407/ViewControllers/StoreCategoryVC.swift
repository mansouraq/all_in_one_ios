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

class StoreCategoryVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwList: UICollectionView!
    @IBOutlet weak var colVwCategory: UICollectionView!
    
    //MARK:- Object
    var objStoreCategoryVM = StoreCategoryVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSearch(_ sender: Any) {
    }
}
