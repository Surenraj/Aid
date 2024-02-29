//
//  UIApplication.swift
//  Aid
//
//  Created by Suren Raj on 28/02/24.
//

import Foundation
import UIKit

extension UIApplication {

    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }

    class func topNavigation(_ viewController: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UINavigationController? {
        if let nav = viewController as? UINavigationController {
            return nav
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return selected.navigationController
            }
        }
        return viewController?.navigationController
    }
}
