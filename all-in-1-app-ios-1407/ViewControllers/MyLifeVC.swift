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

class MyLifeVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var collVwType: UICollectionView!
    
    //MARK:- Variable
    var objMyLifeVM = MyLifeVM()
    
    //MARK:- Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionStory(_ sender: UIButton) {
        //pushToNext(CreateEventVC.className)
    }
    @IBAction func actionDream(_ sender: UIButton) {
        pushToNext(DreamListVC.className)
    }
    @IBAction func actionTodDo(_ sender: UIButton) {
        pushToNext(DueTodayTaskVC.className)
    }
    @IBAction func actionPositivity(_ sender: UIButton) {
        pushToNext(PositivityVC.className)
    }
    @IBAction func actionAppointment(_ sender: UIButton) {
        pushToNext(AppointmentListVC.className)
    }
}
