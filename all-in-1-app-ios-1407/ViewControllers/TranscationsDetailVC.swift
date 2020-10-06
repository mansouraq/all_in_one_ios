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

class TranscationsDetailVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblTranscationId: UILabel!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSendNotification(_ sender: Any) {
    
    }
    @IBAction func actionMakeRequest(_ sender: Any) {
    }
}
