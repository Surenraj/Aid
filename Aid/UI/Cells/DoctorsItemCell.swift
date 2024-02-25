//
//  DoctorsItemCell.swift
//  Aid
//
//  Created by Suren Raj on 25/02/24.
//

import UIKit

class DoctorsItemCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var activeIcon: UIImageView!
    @IBOutlet weak var ratingStarImg: UIImageView!
    @IBOutlet weak var ratingCount: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var appointmentBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func load() {
        
    }
}
