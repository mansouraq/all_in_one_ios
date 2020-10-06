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
import IQKeyboardManager
import Photos
import Gallery

class CreatePostVC: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet weak var txtVwPost: IQTextView!
    @IBOutlet weak var colVwImages: UICollectionView!
    @IBOutlet weak var vwGallery: UIView!
    
    //MARK:- Object
    var objCreatePostVM = CreatePostVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Config.tabsToShow = [.imageTab, .cameraTab]
        Config.Camera.imageLimit = 6
        Config.Camera.recordLocation = true
        objCreatePostVM.objGalleryController = GalleryController()
        objCreatePostVM.objGalleryController.delegate = self
        vwGallery.addSubview(objCreatePostVM.objGalleryController.view)
    }
    
    //MARK:- IBActions
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionPost(_ sender: Any) {
    }
}
