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

class QrCodeVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblQrCode: UIImageView!
    @IBOutlet weak var vwSlide: UIView!
    @IBOutlet weak var btnScanQr: UIButton!
    @IBOutlet weak var btnMyQr: UIButton!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- IBActions
    @IBAction func actionCancel(_ sender: UIButton) {
        popToBack()
    }
    @IBAction func actionRefresh(_ sender: UIButton) {
    }
    @IBAction func actionDownload(_ sender: UIButton) {
    }
    @IBAction func actionShare(_ sender: UIButton) {
    }
    
    @IBAction func actionMyQr(_ sender: UIButton) {
        btnScanQr.setTitleColor(Color.fadeGrey, for: .normal)
        btnMyQr.setTitleColor(Color.fadeGrey, for: .normal)
        animateSegments(sender)
        sender.setTitleColor(.black, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now()+1.2) {
            self.popToBack()
        }
    }
    func animateSegments(_ sender: UIButton) {
        UIView.animate(withDuration: 0.7) {
            let originX = sender.frame.origin.x+28
            self.vwSlide.frame.origin = CGPoint(x: originX, y: self.vwSlide.frame.origin.y)
            self.view.layoutIfNeeded()
        }
    }
}
