//
//  ViewController.swift
//  Plan In Calendar
//
//  Created by 徳永勇希 on 2021/01/06.
//

import UIKit
import FSCalendar

class ViewController: UIViewController,FSCalendarDelegate,FSCalendarDataSource{
  
    
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var memoaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.layer.cornerRadius = 20
        
        memoaTableView.delegate = self
        memoaTableView.dataSource = self
        
        memoaTableView.layer.cornerRadius = 20
        memoaTableView.separatorStyle = .none
        
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
                formatter.calendar = Calendar(identifier: .gregorian)
                
                
        dateLabel.text = formatter.string(from: date)
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = memoaTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
    
    
    
}

