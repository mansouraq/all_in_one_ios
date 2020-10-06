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
import OnlyPictures

class VoteVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var tblVwVote: UITableView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPollEndDate: UILabel!
    @IBOutlet weak var onlyPictures: OnlyHorizontalPictures!
    
    //MARK:- Object
    var objVoteVM = VoteVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        onlyPictures.dataSource = self
        onlyPictures.isHiddenVisibleCount = false
        onlyPictures.alignment = .left
        onlyPictures.countPosition = .right
        onlyPictures.recentAt = .right
        onlyPictures.spacingColor = UIColor.white
        onlyPictures.backgroundColorForCount = .white
        onlyPictures.backgroundColorForCount = Color.dustyOrange
        onlyPictures.textColorForCount = .white
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionMore(_ sender: Any) {
    }
    @IBAction func actionVote(_ sender: Any) {
        pushToNext(VoteResultsVC.className)
    }
}
