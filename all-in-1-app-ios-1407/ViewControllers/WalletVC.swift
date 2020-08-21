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

class WalletVC: UIViewController {

    //MARK:- Outlets
    @IBOutlet weak var tblVwWallet: UITableView!
    
    //MARK:- Variables
    var objWalletVM = WalletVM()
    
    //MARK:- Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
  }
    //MARK:- Actions
       @IBAction func actionBack(_ sender: UIButton) {
           popToBack()
       }
    
}
