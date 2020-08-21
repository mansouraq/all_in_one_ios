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
import PinterestLayout


class HomeVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var tblVwTopPicks: UITableView!
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var collVwHome: UICollectionView!
    @IBOutlet weak var imgVwBackground: UIImageView!
    @IBOutlet weak var lblMorning: UILabel!
    
    //MARK:- Variables
    var objHomeVM = HomeVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerNib(tblVwTopPicks, identifierCell: "HomeTVC")
        let layout = PinterestLayout()
        collVwHome.collectionViewLayout = layout
        layout.delegate = self
        layout.cellPadding = 6
        layout.numberOfColumns = 2
        getTimeMode()
    }
    
    override func viewDidLayoutSubviews() {
        self.vwContainer.round(corners: [.topLeft, .topRight], cornerRadius: 20)
    }
    
    //MARK:- IBActions
      
      @IBAction func actionMenu(_ sender: Any) {
        KAppDelegate.sideMenu.openLeft()
      }
    
    func getTimeMode(){
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 6..<12 :
            imgVwBackground.image = UIImage(named: "morning")
            lblMorning.text = "Good Morning Jenny !!"
            print(NSLocalizedString("Morning", comment: "Morning"))
        case 12 :
            lblMorning.text = "Good Afternoon Jenny !!"
            imgVwBackground.image = UIImage(named: "morning")
            print(NSLocalizedString("Noon", comment: "Noon"))
            
        case 13..<17 :
            lblMorning.text = "Good Afternoon Jenny !!"
            imgVwBackground.image = UIImage(named: "morning")
            print(NSLocalizedString("Afternoon", comment: "Afternoon"))
        case 17..<22 :
            imgVwBackground.image = UIImage(named: "evening")
            lblMorning.text = "Good Evening Jenny !!"
            print(NSLocalizedString("Evening", comment: "Evening"))
        default:
            imgVwBackground.image = UIImage(named: "night")
            lblMorning.text = "Good Night Jenny !!"
            print(NSLocalizedString("Night", comment: "Night"))
        }
    }
}


