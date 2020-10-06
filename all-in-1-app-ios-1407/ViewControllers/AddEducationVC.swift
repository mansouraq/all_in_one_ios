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

class AddEducationVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtFldCountry: UITextField!
    @IBOutlet weak var txtFldGrade: UITextField!
    @IBOutlet weak var txtFldDegree: UITextField!
    @IBOutlet weak var txtFldStartYear: UITextField!
    @IBOutlet weak var txtFldEndYear: UITextField!
    
    //MARK:- Variables
    var pickerView = UIPickerView()
    var arrCountry = ["India","Russia","America"]
    var selectedTxtFld = UITextField()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionAddEducation(_ sender: Any) {
        pushToNext(AddSkillsVC.className)
    }
}

extension AddEducationVC: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrCountry.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrCountry[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch selectedTxtFld.tag {
        case 1:
            txtFldCountry.text = arrCountry[row]
        case 2:
            txtFldGrade.text = arrCountry[row]
        case 3:
            txtFldStartYear.text = arrCountry[row]
        case 4:
            txtFldEndYear.text = arrCountry[row]
        default:
            break
        }
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField {
        case txtFldCountry:
            selectedTxtFld.tag = txtFldCountry.tag
            txtFldCountry.inputView = pickerView
        case txtFldGrade:
            selectedTxtFld.tag = txtFldGrade.tag
            txtFldGrade.inputView = pickerView
        case txtFldStartYear:
            selectedTxtFld.tag = txtFldStartYear.tag
            txtFldStartYear.inputView = pickerView
        case txtFldEndYear:
            selectedTxtFld.tag = txtFldEndYear.tag
            txtFldEndYear.inputView = pickerView
        default:
            break
        }
        return true
    }
}
