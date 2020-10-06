/**
*
*@copyright : OZVID Technologies Pvt Ltd. < www.ozvid.com >
*@author     : Shiv Charan Panjeta < shiv@ozvid.com >
*
* All Rights Reserved.
* Proprietary and confidential :  All information contained herein is, and remains
* the property of OZVID Technologies Pvt Ltd. and its partners.
* Unauthorized copying of this file, via any medium is strictly prohibited.
*/

import UIKit

class ReceiverTxtTVC: UITableViewCell {
    
    @IBOutlet weak var imgVwReceiverPic: UIImageView!
    @IBOutlet weak var lblReceiverMsg: UILabel!
    @IBOutlet weak var lblReceiverTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
