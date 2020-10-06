/**
   *
   *@copyright : OZVID Technologies Pvt Ltd. < www.ozvid.com >
   *@author     : Shiv Charan Panjeta < shiv@ozvid.com >
   *
   * All Rights Reserved.
   * Proprietary and confidential :  All information contained herein is, and remains
   * the property of OZVID Technologies Pvt Ltd. and its partners.
   * Unauthorized copying of this file, via any medium is strictly prohibited.
   */

import UIKit
import IQKeyboardManager

class ChatVC: UIViewController, UIPopoverPresentationControllerDelegate {
    
    //MARK:- IBOutles
    @IBOutlet weak var tblVwChat: UITableView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgVwUser: RoundedImage!
    @IBOutlet weak var lblOnline: UILabel!
    @IBOutlet weak var colVwChatItem: UICollectionView!
    @IBOutlet weak var vwItem: UIView!
    @IBOutlet weak var vwItemHeightCnst: NSLayoutConstraint!
    @IBOutlet weak var txtVwMessage: IQTextView!
    @IBOutlet weak var vwCall: UIView!
    
    //MARK:- Object
    let objChatVM = ChatVM()
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        vwItemHeightCnst.constant = 0
        Proxy.shared.registerNib(tblVwChat, identifierCell: ViewMoneyTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: ViewLocationTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: ViewEventTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: ViewPollTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: ViewSplitBillTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: SenderTxtTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: ReceiverTxtTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: SenderImgTVC.className)
        Proxy.shared.registerNib(tblVwChat, identifierCell: ReceiverImgTVC.className)
    }
    
    //MARK:- IBOutles
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
    @IBAction func actionSearch(_ sender: Any) {
    }
    @IBAction func actionMore(_ sender: UIButton) {
        showMenuPopOver(sender)
    }
    @IBAction func actionAddItems(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        vwItem.isHidden = !sender.isSelected
        vwItemHeightCnst.constant = sender.isSelected ? 200 : 0
    }
    @IBAction func actionCall(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        vwCall.isHidden = !sender.isSelected
    }
    @IBAction func actionPhoneCall(_ sender: Any) {
    }
    @IBAction func actionVideoCall(_ sender: Any) {
    }
    @IBAction func actionGallery(_ sender: Any) {
    }
    @IBAction func actionCamera(_ sender: Any) {
    }
    @IBAction func actionVoiceRecording(_ sender: Any) {
    }
    @IBAction func actionEmoji(_ sender: Any) {
    }
    //MARK:-  Custom Method
    func showMenuPopOver(_ size:UIView){
        let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "ChatMoreOptionPopupVC") as! ChatMoreOptionPopupVC
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.navigationBar.isHidden = true
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        popoverContent.preferredContentSize = CGSize(width: 200, height: 160)
        popover?.delegate = self
        popover?.sourceView = size
        let width:Int = Int(size.frame.width)
        popover?.sourceRect = CGRect(x: 0, y: 0, width: width, height: 0)
        self.present(nav, animated: true, completion: nil)
    }
    //MARK:- UIPopover presentation controller delegates
    func adaptivePresentationStyle(for: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
