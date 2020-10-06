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

class ChooseBirthdayVC: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var txtFldBirthday: UITextField!
    @IBOutlet weak var txtFldFamilyName: UITextField!
    @IBOutlet weak var txtFldFirstName: UITextField!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionCake(_ sender: Any) {
        pushToNext(SetUsernameVC.className)
    }
    @IBAction func actionBasboosh(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
