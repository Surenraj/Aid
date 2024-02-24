//
//  CategoriesItemCell.swift
//  Aid
//
//  Created by Suren Raj on 24/02/24.
//

import UIKit

class CategoriesItemCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgViewBorder: UIView!
    
    static let nibName = "CategoriesItemCell"
    var category: Category?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadView(category: Category?) {
        
        self.imgViewBorder.layer.borderWidth = 2
        self.imgViewBorder.layer.borderColor = UIColor(hex: "#F7F8F8").cgColor
        self.imgViewBorder.layer.cornerRadius = 17
        
        self.category = category
        self.imgView.image = UIImage(named: category?.imageUrl ?? "")
        self.titleLbl.text = category?.name
    }
}
