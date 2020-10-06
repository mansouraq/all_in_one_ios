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

class ReligionVC: UIViewController {
     //MARK:- IBOutlets
    @IBOutlet weak var tblVwReligion: UITableView!
    
     //MARK:- Variables
    var objReligionVM = ReligionVM()
    
     //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerNib(tblVwReligion, identifierCell: "ReligionTVC")
    }
    //MARK:- IBActions
    
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
