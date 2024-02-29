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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var headerCardView: UIView!
    
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
        
        
        ///
        self.headerCardView.layer.cornerRadius = 35        
        
        ///
        self.searchTextField.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let image = UIImage(named: "searchIcon")
        imageView.image = image
        self.searchTextField.leftView = imageView
        
    }
    
    func load() {
        categoriesListView.reloadData()
    }
    
    func registerCells() {
        self.categoriesListView.register(UINib(nibName: CategoriesItemCell.nibName, bundle: Bundle(for: CategoriesItemCell.self)), forCellWithReuseIdentifier: CategoriesItemCell.nibName)
        
        self.doctorsListView.register(UINib(nibName: DoctorsItemCell.nibName, bundle: Bundle(for: DoctorsItemCell.self)), forCellReuseIdentifier: DoctorsItemCell.nibName)
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
        return self.viewModel?.doctorsList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: DoctorsItemCell.nibName) as? DoctorsItemCell {
            cell.load(doctor: self.viewModel?.doctorsList[indexPath.row])
            cell.navigationController = self.navigationController
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
