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

typealias PassDate = (Date,String) -> ()
class ChooseDateTimeVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK:- Variables
    var objPassDate: PassDate?
    var selectedDate = Date()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    //MARK:- IBActions
    @IBAction func actionCross(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionTick(_ sender: Any) {
        guard let block = objPassDate else {return}
        dismiss(animated: true, completion: nil)
        block(selectedDate, "Date")
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        selectedDate = sender.date
    }
}

