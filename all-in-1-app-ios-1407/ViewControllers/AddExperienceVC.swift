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

class AddExperienceVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldTitle: UITextField!
    @IBOutlet weak var txtVwJobDesc: UITextView!
    @IBOutlet weak var switchWork: UISwitch!
    @IBOutlet weak var txtFldToDate: UITextField!
    @IBOutlet weak var txtFldFromDate: UITextField!
    @IBOutlet weak var txtFldLocation: UITextField!
    @IBOutlet weak var txtFldCompanyName: UITextField!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionAddExperience(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
