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

class SelectTypeVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var colVwType: UICollectionView!
    @IBOutlet weak var pageControlBanner: UIPageControl!
    
    
    //MARK:- Variable
    var objSelectTypeVM = SelectTypeVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControlBanner.numberOfPages = objSelectTypeVM.arrTitle.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //objSelectTypeVM.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        //objSelectTypeVM.timer?.invalidate()
    }
    //MARK:- Button actions
    @IBAction func actnRegister(_ sender: Any) {
        pushToNext(RegisterVC.className)
    }
    @IBAction func actnLogin(_ sender: Any) {
        pushToNext(LoginVC.className)
    }
    
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    //    @objc func changeImage() {
//        if objSelectTypeVM.changeImageCounter == objSelectTypeVM.arrImages.count {
//            objSelectTypeVM.changeImageCounter = 0
//        }
//        imgVwTop.alpha = 1
//        imgVwTop.animationDuration = 0.6
//        imgVwTop.image = objSelectTypeVM.arrImages[objSelectTypeVM.changeImageCounter]
//        lblTitle.text = objSelectTypeVM.arrTitle[objSelectTypeVM.changeImageCounter]
//        lblSubTitle.text = objSelectTypeVM.arrSubTitle[objSelectTypeVM.changeImageCounter]
//        UIImageView.commitAnimations()
//        objSelectTypeVM.changeImageCounter += 1
//    }
}

