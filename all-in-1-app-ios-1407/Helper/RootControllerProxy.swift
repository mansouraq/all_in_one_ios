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

import Foundation
import UIKit

class RootControllerProxy {
    static var shared: RootControllerProxy {
        return RootControllerProxy()
    }
    fileprivate init(){}
    
    func rootWithoutDrawer(_ identifier: String,storyboarySelected:UIStoryboard = mainStoryboard){
        
        let blankController = storyboarySelected.instantiateViewController(withIdentifier: identifier)
        var homeNavController:UINavigationController = UINavigationController()
        
        homeNavController = UINavigationController.init(rootViewController: blankController)
        homeNavController.isNavigationBarHidden = true
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                let window:UIWindow =  sd.window!
               window.rootViewController = homeNavController
                window.makeKeyAndVisible()
                
            }
        } else {
        KAppDelegate.window!.rootViewController = homeNavController
        KAppDelegate.window!.makeKeyAndVisible()
        }
        
    }
    func rootWithDrawer(_  identifier: String, storyboarySelected:UIStoryboard = mainStoryboard,titleStr: String=""){
        let mainViewController = storyboarySelected.instantiateViewController(withIdentifier:identifier)
        let sideViewController = storyboarySelected.instantiateViewController(withIdentifier: MenuVC.className)
        let mainNav: UINavigationController = UINavigationController(rootViewController: mainViewController)
        let sideNav: UINavigationController = UINavigationController(rootViewController: sideViewController)
        let slideMenuController = SlideMenuController.init(mainViewController: mainNav, leftMenuViewController: sideNav)
        slideMenuController.delegate = mainViewController as?  SlideMenuControllerDelegate
        mainViewController.title = titleStr
        KAppDelegate.sideMenu = slideMenuController
        mainNav.isNavigationBarHidden = true
        sideNav.isNavigationBarHidden = true
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
                let window:UIWindow =  sd.window!
               window.rootViewController = slideMenuController
                window.makeKeyAndVisible()
                
            }
        } else {
            KAppDelegate.window?.rootViewController = slideMenuController
            KAppDelegate.window?.makeKeyAndVisible()
        }
    }
    
}
