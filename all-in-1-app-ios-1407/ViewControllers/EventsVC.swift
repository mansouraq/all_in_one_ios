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


class EventsVC: UIViewController{

    //Mark:- IBOutlets
    @IBOutlet weak var btnsearch: UIButton!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var collVwEvent: UICollectionView!
    @IBOutlet weak var collVwPopularPromo: UICollectionView!
    @IBOutlet weak var collVwPromo: UICollectionView!
    @IBOutlet weak var tblVwEvent: UITableView!
    
    //Mark:- Variables
    var objeventVM = EventVM()
    
    //Mark:- View Life Cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        Proxy.shared.registerNib(tblVwEvent, identifierCell: "PromoTVC")
        Proxy.shared.registerCollViewNib(collVwEvent, identifierCell: "EventCVC")
        Proxy.shared.registerCollViewNib(collVwPopularPromo, identifierCell: "PopularPromoCVC")
        Proxy.shared.registerCollViewNib(collVwPromo, identifierCell: "PromoCVC")

   }
    @IBAction func actionBack(_ sender: Any) {
        popToBack()
    }
}
