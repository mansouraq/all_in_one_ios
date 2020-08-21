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

class VerificationVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnVerify: UIButton!
    @IBOutlet weak var btnResendCode: UIButton!
    @IBOutlet weak var lblVerificationNo: UILabel!
    @IBOutlet weak var txtFldFirst: UITextField!
    @IBOutlet weak var txtFldSecond: UITextField!
    @IBOutlet weak var txtFldThird: UITextField!
    @IBOutlet weak var txtFldFourth: UITextField!
    @IBOutlet weak var txtFldFifth: UITextField!
    
    //MARK:- Object
    var objVerificationVM = VerificationVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionVerify(_ sender: Any) {
        RootControllerProxy.shared.rootWithDrawer(MainTBC.className)
    }
    @IBAction func actionResendcode(_ sender: Any) {
        objVerificationVM.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        if objVerificationVM.counter != 0 {
            btnResendCode.setTitle(self.timeFormatted(objVerificationVM.counter), for: .normal)
            btnResendCode.isUserInteractionEnabled = false
            objVerificationVM.counter -= 1
        } else {
            if let timer = objVerificationVM.timer {
                timer.invalidate()
                objVerificationVM.timer = nil
                objVerificationVM.counter = 30
                btnResendCode.isUserInteractionEnabled = true
                btnResendCode.setTitle(TitleMessage.resend, for: .normal)
            }
        }
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    @IBAction func actionAlreadyAccount(_ sender: Any) {
    }
}
