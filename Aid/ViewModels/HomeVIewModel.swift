//
//  HomeVIewModel.swift
//  Aid
//
//  Created by Suren Raj on 24/02/24.
//

import Foundation

class HomeViewModel {
    
    var categoryList: [Category] = [
        .init(name: "All", imageUrl: "allCategoryIcon"),
        .init(name: "Cardiology", imageUrl: "cardiologyIcon"),
        .init(name: "Medicine", imageUrl: "medicineIcon"),
        .init(name: "General", imageUrl: "generalIcon")
    ]
    
    var doctorsList: [Doctor] = [
        .init(name: "Dr. Maria Waston", designation: "Heart Surgeon, London, England", doctorImg: "sampleDoc1", isAvailable: true, ratings: "4.5"),
        .init(name: "Dr. Stevi Jessi", designation: "General Dentist", doctorImg: "sampleDoc2", isAvailable: true, ratings: "4.8"),
        .init(name: "Dr. Rodger Struck", designation: "Heart Surgeon, London, England", doctorImg: "sampleDoc3", isAvailable: true, ratings: "4.1"),
        .init(name: "Dr. Kathy Pacheco", designation: "Heart Surgeon, London, England", doctorImg: "sampleDoc4", isAvailable: true, ratings: "4.7"),
        .init(name: "Dr. Chris Glasser", designation: "Heart Surgeon, London, England", doctorImg: "sampleDoc5", isAvailable: true, ratings: "4.6")
    ]
}

