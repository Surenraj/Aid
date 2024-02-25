//
//  HomeViewController.swift
//  Aid
//
//  Created by Suren Raj on 21/02/24.
//

import UIKit

class HomeViewController: UIViewController {
   
    @IBOutlet weak var bottomNavigationView: UIView!
    @IBOutlet weak var categoriesListView: UICollectionView!
    @IBOutlet weak var doctorsListView: UITableView!
    var viewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.load()
    }
    
    func initialSetup() {
        categoriesListView.delegate = self
        categoriesListView.dataSource = self
        
        doctorsListView.delegate = self
        doctorsListView.dataSource = self
        
        
        self.viewModel = HomeViewModel()
        registerCells()
        
        
        ///
        self.bottomNavigationView.layer.cornerRadius = 10
        self.bottomNavigationView.layer.shadowColor = UIColor(hex: "#f7f8fb").cgColor
        self.bottomNavigationView.layer.shadowOpacity = 10
        self.bottomNavigationView.layer.shadowOffset = .zero
        self.bottomNavigationView.layer.shadowRadius = 10
        
    }
    
    func load() {
        categoriesListView.reloadData()
    }
    
    func registerCells() {
        self.categoriesListView.register(UINib(nibName: CategoriesItemCell.nibName, bundle: Bundle(for: CategoriesItemCell.self)), forCellWithReuseIdentifier: CategoriesItemCell.nibName)
    }
}


extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {

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


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
