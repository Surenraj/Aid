//
//  UIViewController.swift
//  Aid
//
//  Created by Suren Raj on 28/02/24.
//

import Foundation
import UIKit

extension UIViewController {
    static func storyboardInstance() -> Self? {
        let instanceString = String(describing: self)
        let storyboard = UIStoryboard(name: instanceString, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: instanceString) as? Self
    }
}
