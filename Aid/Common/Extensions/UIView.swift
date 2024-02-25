//
//  UIView.swift
//  Aid
//
//  Created by Suren Raj on 25/02/24.
//

import Foundation
import UIKit

extension UIView {
    public func setGradientBackground(startColor: UIColor, endColor: UIColor) {

        layer.sublayers?.filter { $0 is CAGradientLayer }.forEach { $0.removeFromSuperlayer() }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.frame = bounds
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
