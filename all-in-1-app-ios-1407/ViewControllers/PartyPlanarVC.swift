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

class PartyPlanarVC: UIViewController {
    
    //MARK:- IBActions
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtFldServices: UITextField!
    @IBOutlet weak var colVwServices: UICollectionView!
    @IBOutlet weak var pageControlService: UIPageControl!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBOutlets
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
