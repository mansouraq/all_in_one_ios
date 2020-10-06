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

class AddShippingVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldStreetAddress: UITextField!
    @IBOutlet weak var txtFldFullName: UITextField!
    @IBOutlet weak var txtFldSaveAddress: UITextField!
    @IBOutlet weak var txtFldApt: UITextField!
    @IBOutlet weak var txtFldPhoneNo: UITextField!
    @IBOutlet weak var txtFldCity: UITextField!
    @IBOutlet weak var txtFldZipcode: UITextField!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSaveAddress(_ sender: Any) {
    }
}
