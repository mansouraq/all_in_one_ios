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

class PositivityVC: UIViewController {
    
    //MARK:- IBActions
    @IBOutlet weak var lblPositivityCount: UILabel!
    @IBOutlet weak var lblTotalPositivityCount: UILabel!
    
    //MARK:- Object
    var objPositivityVM = PositivityVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionAdd(_ sender: Any) {
        presentVC(identifier: AddPositivityPopupVC.className, animate: true)
    }
}
