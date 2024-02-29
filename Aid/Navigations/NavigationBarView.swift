//
//  NavigationBarView.swift
//  Aid
//
//  Created by Suren Raj on 28/02/24.
//

import Foundation
import UIKit

protocol NavigationViewDelegate: AnyObject {
    func onBackPressed()
    func onRightBtnTapped()
}

class NavigationBarView: UIView {
    
    static var nibName: String = "NavigationBarView"
    ///
    @IBOutlet weak var titleLbl: UILabel!
    weak var delegate: NavigationViewDelegate?
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        self.onCreate()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        self.onCreate()
    }
    
    func onCreate() {
        
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: NavigationBarView.nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.delegate?.onBackPressed()
    }
    
    
    @IBAction func rightBtnAction(_ sender: Any) {
        self.delegate?.onRightBtnTapped()
    }
    
}
