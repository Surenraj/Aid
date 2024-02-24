//
//  HomeViewController.swift
//  Aid
//
//  Created by Suren Raj on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
   
    @IBOutlet weak var categoriesListView: UICollectionView!
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.load()
    }
    
    func initialSetup() {
        categoriesListView.delegate = self
        categoriesListView.dataSource = self
        self.viewModel = HomeViewModel()
        registerCells()
    }
    
    func load() {
        categoriesListView.reloadData()
    }
    
    func registerCells() {
        self.categoriesListView.register(UINib(nibName: CategoriesItemCell.nibName, bundle: Bundle(for: CategoriesItemCell.self)), forCellWithReuseIdentifier: CategoriesItemCell.nibName)
    }
}


extension HomeViewController : UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel?.categoryList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesItemCell.nibName, for: indexPath) as? CategoriesItemCell {
            
            cell.loadView(category: self.viewModel?.categoryList[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
}
