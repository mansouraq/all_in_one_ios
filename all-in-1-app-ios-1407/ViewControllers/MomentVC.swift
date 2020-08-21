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
import JJFloatingActionButton

class MomentVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var btnBck: UIButton!
    @IBOutlet weak var lblFollowingCount: UILabel!
    @IBOutlet weak var lblMomentCount: UILabel!
    @IBOutlet weak var imgVwUser: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tblVwMoment: UITableView!
    @IBOutlet weak var lblFollowerCount: UILabel!
    @IBOutlet weak var btnAdd: JJFloatingActionButton!
    
    //MARK:- Object
    var objMomentVM = MomentVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerNib(tblVwMoment, identifierCell: "MomentFlightTVC")
        Proxy.shared.registerNib(tblVwMoment, identifierCell: "MomentCommentTVC")
        Proxy.shared.registerNib(tblVwMoment, identifierCell: "MomentQuoteTVC")
        Proxy.shared.registerNib(tblVwMoment, identifierCell: "MomentTextTVC")
        Proxy.shared.registerNib(tblVwMoment, identifierCell: "MomentVideoTVC")
        tblVwMoment.reloadData()
        configureActionButton()
    }
    
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
    }
    
    fileprivate func configureActionButton() {
        btnAdd.itemAnimationConfiguration = .circularSlideIn(withRadius: 120)
        btnAdd.buttonAnimationConfiguration = .rotation(toAngle: .pi * 3 / 4)
        btnAdd.buttonAnimationConfiguration.opening.duration = 0.8
        btnAdd.buttonAnimationConfiguration.closing.duration = 0.6
        addItems()
    }
    
    fileprivate func addItems() {
        btnAdd.addItem(title: "", image: #imageLiteral(resourceName: "ic_edit")) { item in
            
        }
        
        btnAdd.addItem(title: "", image: #imageLiteral(resourceName: "ic_camera")) { item in
            
        }
        btnAdd.addItem(title: "", image: #imageLiteral(resourceName: "ic_location")) { item in
            
        }
        btnAdd.addItem(title: "", image: #imageLiteral(resourceName: "ic_video")) { item in
                   
        }
    }
}

extension MomentVC: JJFloatingActionButtonDelegate {
    func floatingActionButtonWillOpen(_ button: JJFloatingActionButton) {
        print("Action button will open: \(button.state)")
    }
    
    func floatingActionButtonDidOpen(_ button: JJFloatingActionButton) {
        print("Action button did open: \(button.state)")
    }
    
    func floatingActionButtonWillClose(_ button: JJFloatingActionButton) {
        print("Action button will close: \(button.state)")
    }
    
    func floatingActionButtonDidClose(_ button: JJFloatingActionButton) {
        print("Action button did close: \(button.state)")
    }
}
