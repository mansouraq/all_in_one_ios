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
import UBottomSheet

class AddFriendPopupVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldPersonName: UITextField!
    @IBOutlet weak var tblVwAddFriend: UITableView!
    
    //MARK:- Variables
    var sheetCoordinator: UBottomSheetCoordinator?
    var sheetVC: DraggableItem!
    var dataSource: UBottomSheetCoordinatorDataSource?
    var backView: PassThroughView?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:- IBActions
    @IBAction func actionCross(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionAddPerson(_ sender: Any) {
        
    }
}

extension AddFriendPopupVC : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "AddFriendTVC") as! AddFriendTVC
        return Cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "AddFriendHeaderTVC") as! AddFriendHeaderTVC
        return headerCell
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
