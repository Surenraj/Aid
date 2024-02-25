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
    
    var doctorsList: [] = [
        
    
    ]
}

