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
import SNCollectionViewLayout
import OnlyPictures

class OnlineEventBannerTVC: UITableViewCell {
    @IBOutlet weak var colVwBanner: UICollectionView!
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var btnReadMore: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    func reloadData() {
        colVwBanner.delegate = self
        colVwBanner.dataSource = self
        colVwBanner.reloadData()
    }
}
class EventAddressTVC: UITableViewCell {
    @IBOutlet weak var imgVwEvent: UIImageView!
    @IBOutlet weak var btnViewMap: UIButton!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnHeightCnst: NSLayoutConstraint!
}
class EventGalleryTVC: UITableViewCell {
    @IBOutlet weak var colVwEvent: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let snCollectionViewLayout = SNCollectionViewLayout()
        snCollectionViewLayout.fixedDivisionCount = 4
        snCollectionViewLayout.delegate = self
        colVwEvent.collectionViewLayout = snCollectionViewLayout
    }
    func reloadData() {
        colVwEvent.delegate = self
        colVwEvent.dataSource = self
        colVwEvent.reloadData()
    }
}
class EventHeaderTVC: UITableViewCell {
    @IBOutlet weak var imgVwCircle: UIImageView!
    @IBOutlet weak var btnHeader: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
}
class EventAttendTVC: UITableViewCell {
    @IBOutlet weak var lblPeopleCount: UILabel!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var btnLikes: UIButton!
    @IBOutlet weak var colVwPeoples: UICollectionView!
    @IBOutlet weak var colVwTag: UICollectionView!
    @IBOutlet weak var onlyPictures: OnlyHorizontalPictures!
    
    var arrImg = [#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle"),#imageLiteral(resourceName: "rectangle")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // onlyPictures.delegate = self
        onlyPictures.dataSource = self
        onlyPictures.isHiddenVisibleCount = false
        onlyPictures.alignment = .center
        onlyPictures.countPosition = .right
        onlyPictures.recentAt = .left
        onlyPictures.spacingColor = UIColor.white
        onlyPictures.backgroundColorForCount = .white
        onlyPictures.backgroundColorForCount = Color.dustyOrange
        onlyPictures.textColorForCount = .white
        // onlyPictures.fontForCount = UIFont(name: FontName.regular, size: 15) ?? UIFont.
        onlyPictures.spacing = 2
    }
    
    func reloadData() {
        colVwTag.delegate = self
        colVwTag.dataSource = self
        colVwTag.reloadData()
    }
}
class AboutEventTVC: UITableViewCell {
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
}

extension OnlineEventBannerTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineEventBannerCVC", for: indexPath) as! OnlineEventBannerCVC
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}
extension EventGalleryTVC: UICollectionViewDelegate, UICollectionViewDataSource, SNCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventGalleryCVC", for: indexPath) as! EventGalleryCVC
        return cell
    }
    
    func scaleForItem(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, atIndexPath indexPath: IndexPath) -> UInt {
        if indexPath.row == 1 || indexPath.row == 5 {
            return 2
        }
        return 1
    }
}
extension EventAttendTVC: UICollectionViewDelegate, UICollectionViewDataSource , OnlyPicturesDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventTagCVC", for: indexPath) as! EventTagCVC
        return cell
    }
    func numberOfPictures() -> Int {
        return arrImg.count
    }
    
    func visiblePictures() -> Int {
        return 3
    }
    
    func pictureViews(index: Int) -> UIImage {
        return arrImg[index]
    }
    
    func pictureViews(_ imageView: UIImageView, index: Int) {
        imageView.image = arrImg[index]
    }
    
    func pictureView(_ imageView: UIImageView, didSelectAt index: Int) {
        debugPrint(index)
    }
}

