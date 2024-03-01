//
//  AppointmentsViewController.swift
//  Aid
//
//  Created by Suren Raj on 27/02/24.
//

import UIKit

class AppointmentsViewController: UIViewController {

    @IBOutlet weak var monthTitleLbl: UILabel!
    @IBOutlet weak var weeklyCalendarCollectionView: UICollectionView!
    var totalSquares = [Date]()
    var selectedDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
        self.registerCells()
    }
    
    
    func initialSetup() {
        weeklyCalendarCollectionView.delegate = self
        weeklyCalendarCollectionView.dataSource = self
        
        setCellsView()
        setWeekView()
    }
    
    func registerCells() {
        self.weeklyCalendarCollectionView.register(UINib(nibName: WeeklyCalenderCell.nibName, bundle: Bundle(for: WeeklyCalenderCell.self)), forCellWithReuseIdentifier: WeeklyCalenderCell.nibName)
    }
    
    func setCellsView()
    {
        let width = (weeklyCalendarCollectionView.frame.size.width - 2) / 8
        let height = (weeklyCalendarCollectionView.frame.size.height - 2)
        
        if let flowLayout = weeklyCalendarCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.itemSize = CGSize(width: width, height: height)
        }
    }
    
    func setWeekView()
    {
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday)
        {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        monthTitleLbl.text = CalendarHelper().monthString(date: selectedDate)
        weeklyCalendarCollectionView.reloadData()
    }
}


extension AppointmentsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeeklyCalenderCell.nibName, for: indexPath) as? WeeklyCalenderCell {
            
            let date = totalSquares[indexPath.item]
//            cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
            
            if(date == selectedDate)
            {
                cell.backgroundColor = UIColor.systemGreen
            }
            else
            {
                cell.backgroundColor = UIColor.white
            }
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        selectedDate = totalSquares[indexPath.item]
        weeklyCalendarCollectionView.reloadData()
    }
}
