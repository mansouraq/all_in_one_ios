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

class AddPlaceVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var vwMap: UIView!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtFldSearchLocation: UITextField!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions

    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionPost(_ sender: Any) {
    }
    @IBAction func actionCheckIn(_ sender: Any) {
    }
    @IBAction func actionMention(_ sender: Any) {
    }
    @IBAction func actionShareWith(_ sender: Any) {
    }
}
