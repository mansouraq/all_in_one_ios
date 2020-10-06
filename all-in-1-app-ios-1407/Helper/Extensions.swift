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


//MARK:- UIViewController
extension UIViewController {
    
    func pushToNext(_  identifier:String,storyboarySelected:UIStoryboard = mainStoryboard, animate:Bool=true, titleVal:String="" ){
        let pushControllerObj = storyboarySelected.instantiateViewController(withIdentifier: identifier)
        pushControllerObj.title = titleVal
        self.navigationController?.pushViewController(pushControllerObj, animated: animate)
    }
    func popToBack(_ animated:Bool=true){
        self.navigationController?.popViewController(animated: animated)
    }
    func presentVC(_ storyboarySelected:UIStoryboard = mainStoryboard,identifier:String, animate:Bool, titleVal:String="") {
        let presentControllerObj  = storyboarySelected.instantiateViewController(withIdentifier: identifier)
        presentControllerObj.title = titleVal
        self.navigationController?.present(presentControllerObj, animated: animate, completion: nil)
    }
    
    //MARK:- Present/Dismiss methods
    func presentWithNavigation(_ identifier: String, titleStr: String = "") {
        
        let navController = UINavigationController.init(rootViewController: mainStoryboard.instantiateViewController(withIdentifier: identifier))
        navController.isNavigationBarHidden = true
        navController.title = titleStr
        self.present(navController, animated: true, completion: {})
        
    }
    
    func rootToVC(_ storyboarySelected:UIStoryboard = mainStoryboard,identifier:String) {
        let rootControllerObj = storyboarySelected.instantiateViewController(withIdentifier: identifier)
        self.view.window?.rootViewController = rootControllerObj
    }
}
extension UIViewController {
    
    func removeChild() {
        self.children.forEach {
            $0.didMove(toParent: nil)
            $0.view.removeFromSuperview()
            $0.removeFromParent()
        }
    }
    
    func hideContentController(content: UIViewController) {
        content.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
    func deleteAlert(_ message: String, completion:@escaping(_ success:Bool) -> Void)  {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Yes", style: .default) {
            UIAlertAction in
            completion(true)
        }
        let cancelAction = UIAlertAction(title: "No", style: .destructive, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension UIView {
    func showAnimations(_ completion: ((Bool) -> Swift.Void)? = nil) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.layoutIfNeeded()
            self.layoutSubviews()
        }, completion: completion)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func round(corners: UIRectCorner, cornerRadius: Double) {
        let size = CGSize(width: cornerRadius, height: cornerRadius)
        let bezierPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: size)
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.path = bezierPath.cgPath
        self.layer.mask = shapeLayer
    }
    
    func addDashedBorder(start p0: CGPoint, end p1: CGPoint, lineColor: UIColor) {
        self.layoutIfNeeded()
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [3, 3]
        let path = CGMutablePath()
        path.addLines(between: [p0, p1])
        shapeLayer.path = path
        self.layer.addSublayer(shapeLayer)
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderViewColor: UIColor? {
        get {
            let color = UIColor.init(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 5)
            layer.shadowOpacity = 0.4
            layer.shadowRadius = newValue
            layer.cornerRadius = shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    @IBInspectable
    var roundedTopCorners: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.cornerRadius = newValue
            if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
            }
        }
    }
    func addGradiant() {
        let GradientLayerName = "gradientLayer"
        
        if let oldlayer = self.layer.sublayers?.filter({$0.name == GradientLayerName}).first {
            oldlayer.removeFromSuperlayer()
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [Color.blue.cgColor,Color.sky.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        gradientLayer.name = GradientLayerName
        self.clipsToBounds = true
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBInspectable
       var roundedBottomCorners: CGFloat {
           get {
               return layer.shadowRadius
           }
           set {
               layer.cornerRadius = newValue
               if #available(iOS 11.0, *) {
                layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
               }
           }
       }
}

extension String {
    
    var isValidEmail : Bool  {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return (self.range(of: emailRegEx, options:.regularExpression) == nil)
    }
    var isValidName: Bool {
        return (self.range(of: "[^a-zA-Z ]", options: .regularExpression) != nil)
    }
    
    
    var isValidPassword:  Bool{
        let passwordreg =  ("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$")
        let passwordtesting = NSPredicate(format: "SELF MATCHES %@", passwordreg)
        return passwordtesting.evaluate(with: self)
    }
    
    
    
    var isBlank : Bool {
        return (self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
    }
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [NSAttributedString.DocumentReadingOptionKey.documentType:  NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    var removeHtmlTags: String {
        let removehtmlTags  = self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        return removehtmlTags.replacingOccurrences(of: "&[^;]+;", with: "", options: .regularExpression, range: nil)
    }
    
}

//MARK:- String
extension String {
    var isNumeric: Bool {
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    func separate(every stride: Int = 4, with separator: Character = " ") -> String {
        return String(enumerated().map { $0 > 0 && $0 % stride == 0 ? [separator, $1] : [$1]}.joined())
    }
}

//MARK:- UITextView
extension UITextView {
    var isBlankTextView : Bool {
        return (self.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)!
    }
}

extension UITextField{
    class func connectAllTxtFieldFields(txtfields:[UITextField]) -> Void {
        guard let last = txtfields.last else {
            return
        }
        for i in 0 ..< txtfields.count - 1 {
            txtfields[i].returnKeyType = .next
            txtfields[i].addTarget(txtfields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
            
        }
        last.returnKeyType = .done
        last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
        
    }
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
            
        }
    }
    
}

extension Date{
    
    // MARK: - Format dates
    func stringFromFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.autoupdatingCurrent
        formatter.calendar = Calendar.autoupdatingCurrent
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
extension String {
    //right is the first encountered string after left
    func between(_ left: String, _ right: String) -> String? {
        guard let leftRange = range(of: left), let rightRange = range(of: right, options: .backwards)
            ,leftRange.upperBound <= rightRange.lowerBound else { return nil }
        
        let sub = self[leftRange.upperBound...]
        let closestToLeftRange = sub.range(of: right)!
        return String(sub[..<closestToLeftRange.lowerBound])
    }
    func firstCharacterUpperCase() -> String? {
        guard !isEmpty else { return nil }
        let lowerCasedString = self.lowercased()
        return lowerCasedString.replacingCharacters(in: lowerCasedString.startIndex...lowerCasedString.startIndex, with: String(lowerCasedString[lowerCasedString.startIndex]).uppercased())
    }
}



extension UITapGestureRecognizer {
    
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)
        
        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        
        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize
        
        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                          y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y:
            locationOfTouchInLabel.y - textContainerOffset.y);
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
extension UITextField {
    
    /// Adding gray view as leftside of UITextField
    @IBInspectable var addLeftView: Bool {
        get {
            return false
        } set {
            if newValue {
                let left: UIView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 30.0, height: self.frame.size.height))
                left.backgroundColor = UIColor.gray
                leftViewMode = .always
                self.leftView = left
                
            }
        }
    }
    @IBInspectable var leftSide:UIImage {
        get {
            return UIImage()
        } set {
            let left: UIImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 30, height: self.frame.size.height))
            left.image = newValue
            left.contentMode = .center
            leftViewMode = .always
            self.leftView = left
        }
    }
    
    @IBInspectable var rightSide:UIImage {
        get {
            return UIImage()
        } set {
            let right: UIImageView = UIImageView(frame: CGRect(x: self.frame.size.width , y: 0.0, width: 10, height: self.frame.size.height))
            right.image = newValue
            right.contentMode = .center
            rightViewMode = .always
            self.rightView = right
        }
    }
    
    
    var isBlank : Bool {
        return (self.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)!
    }
    
    var trimmedValue : String {
        return (self.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
    }
    
    func rightImage(image:UIImage,imgW:Int,imgH:Int)  {
        self.rightViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imgW, height: imgH))
        imageView.image = image
        self.rightView = imageView
    }
    
    func leftImageAndPlaceHolder(image:UIImage,imgW:Int,imgH:Int,txtString: String)  {
        self.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x:100, y: 0, width: imgW, height: imgH))
        imageView.contentMode = .center
        imageView.clipsToBounds = true
        imageView.image = image
        self.leftView = imageView
        self.layer.cornerRadius = self.frame.size.height/2
        self.attributedPlaceholder = NSAttributedString(string: txtString, attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
    }
    
    func bottomBorder() {
        let border = CALayer()
        let width  = CGFloat(1.0)
        border.borderColor = (UIColor.lightGray).cgColor
        border.borderWidth = width
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: 1)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
