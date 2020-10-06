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

class SaveLocationVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldCountry: UITextField!
    @IBOutlet weak var txtFldAddress: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var txtFldState: UITextField!
    @IBOutlet weak var txtFldZipCode: UITextField!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSaveLocation(_ sender: Any) {
        pushToNext(AddEducationVC.className)
    }
}
