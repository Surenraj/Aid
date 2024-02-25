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
    
    var doctor: Doctor?
    
    static let nibName = "DoctorsItemCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func load(doctor: Doctor?) {
        self.doctor = doctor
                
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor(hex: "#F7F8F8").cgColor
        self.layer.cornerRadius = 17
        
        
        ///
        self.name.text = self.doctor?.name
        self.designation.text = self.doctor?.designation
        self.imgView.image = UIImage(named: doctor?.doctorImg ?? "")
        self.ratingCount.text = doctor?.ratings
    }
}
