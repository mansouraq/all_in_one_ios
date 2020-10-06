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
import IQKeyboardManager

class ChooseLocationVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var vwMap: UIView!
    @IBOutlet weak var lblFullAddress: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var txtFldLocationDetails: UITextField!
    @IBOutlet weak var txtVwNote: IQTextView!
    
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
    @IBAction func actionUseLocation(_ sender: Any) {
        pushToNext(SaveLocationVC.className)
    }
}
