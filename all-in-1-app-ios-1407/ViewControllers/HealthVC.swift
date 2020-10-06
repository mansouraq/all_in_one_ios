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

class HealthVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var collVwDailyMacros: UICollectionView!
    @IBOutlet weak var collVwExercise: UICollectionView!
    @IBOutlet weak var collVwMealLogs: UICollectionView!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Proxy.shared.registerCollViewNib(collVwExercise, identifierCell: "HealthExerciseCVC")
        Proxy.shared.registerCollViewNib(collVwMealLogs, identifierCell: "HealthMealCVC")
        
    }
    //MARK:- IBActions
    
    @IBAction func actionBack(_ sender: UIButton) {
        popToBack()
    }
}
