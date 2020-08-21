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

class MusicVC: UIViewController {
    
     //MARK:- Outlets
    @IBOutlet weak var tblVwList: UITableView!
    @IBOutlet weak var colVwMusic: UICollectionView!
    
    //MARK :- Variables
    var objMusicVM = MusicVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        colVwMusic.dataSource = self
        colVwMusic.delegate = self
        colVwMusic.reloadData()
        tblVwList.reloadData()
    }
    
    //MARK:- Actions
    @IBAction func actionBack(_ sender: UIButton) {
        popToBack()
    }
}
