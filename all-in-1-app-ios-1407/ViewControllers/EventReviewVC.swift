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

class EventReviewVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwEventReview: UITableView!
    @IBOutlet weak var colVwEvent: UICollectionView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    //MARK:- Object
    var objEventReviewVM = EventReviewVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionGoToEvent(_ sender: Any) {
        
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionMore(_ sender: Any) {
        
    }
}
