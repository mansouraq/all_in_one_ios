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

class DreamListVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwDreamList: UITableView!
    @IBOutlet weak var colVwDream: UICollectionView!
    
    //MARK:- Object
    var objDreamListVM = DreamListVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSelctedSection(_ sender: UIButton) {
        objDreamListVM.selectedSection = objDreamListVM.selectedSection == sender.tag ? -1 : sender.tag
        tblVwDreamList.reloadData()
    }
}
