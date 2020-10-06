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

class PersonalityTypeVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var colVwPersonality: UICollectionView!
    @IBOutlet weak var colVwPersonalityType: UICollectionView!
    
    //MARK:- IBOutlets
    var objPersonalityTypeVM = PersonalityTypeVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionShare(_ sender: Any) {
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionTakeScreenshot(_ sender: Any) {
    }
    @IBAction func actionFinish(_ sender: Any) {
    }
}
