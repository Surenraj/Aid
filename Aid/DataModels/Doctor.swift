//
//  Doctor.swift
//  Aid
//
//  Created by Suren Raj on 25/02/24.
//

import Foundation

struct Doctor {
    var name: String?
    var designation: String?
    var doctorImg: String?
    var isAvailable: Bool?
    var ratings: String?
    
    init(name: String?, designation: String?, doctorImg: String?, isAvailable: Bool?, ratings: String?) {
        self.name = name
        self.designation = designation
        self.doctorImg = doctorImg
        self.isAvailable = isAvailable
        self.ratings = ratings
    }
}
