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

class MenuVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var btnBck: UIButton!
    @IBOutlet weak var tblVwMenu: UITableView!
    
    //MARK:- Variables
    var objmenuVM = MenuVM()
    
    //MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerNib(tblVwMenu, identifierCell: MenuTVC.className)
    }
    
    @IBAction func btnActionBck(_ sender: Any) {
        KAppDelegate.sideMenu.closeLeft()
    }
    @IBAction func actionLogout(_ sender: Any) {
        KAppDelegate.sideMenu.closeLeft()
        logoutAlert()
    }
    func logoutAlert() {
        let controller = UIAlertController(title: AppInfo.appName, message: AlertMessage.logout, preferredStyle: .alert)
        let okAction = UIAlertAction(title: TitleMessage.ok, style: .default) { (action) in
            RootControllerProxy.shared.rootWithoutDrawer(ChooseLanguageVC.className)
            Proxy.shared.displayStatusAlert(AlertMessage.logoutSuccess)
        }
        let cancelAction = UIAlertAction(title: TitleMessage.cancelSmall, style: .default, handler: nil)
        controller.addAction(okAction)
        controller.addAction(cancelAction)
        controller.view.tintColor = Color.dustyOrange
        self.present(controller, animated: true, completion: nil)
    }
}
