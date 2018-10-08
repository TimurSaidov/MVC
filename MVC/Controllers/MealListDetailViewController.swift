//
//  MealListDetailViewController.swift
//  MVC
//
//  Created by Timur Saidov on 07/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class MealListDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Время приёма:", "Информация о пище:"]
    var meal: Meal?

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
        title = meal?.name
        
        tableView.rowHeight = UITableView.automaticDimension // Автоматическое увеличение высоты строки.
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 1
        default:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MealListDetailTableViewCell
            
            if let photo = meal?.photo {
                cell.mealDetailImageView.image = UIImage(named: photo)
            }
            guard let mealName = meal?.name else { return cell }
            guard let mealDate = meal?.timestamp else { return cell }
            let date = DateFormatter.localizedString(from: mealDate, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
            cell.mealDetailLabel.text = "Съеден \(mealName) \(date)."
        
            return cell
        default:
            let cellOfInfarmation = tableView.dequeueReusableCell(withIdentifier: "CellOfInformation", for: indexPath) as! MealListDetailOfInfTableViewCell
            
            switch indexPath.row {
            case 0:
                cellOfInfarmation.keyLabel.text = "Название:"
                cellOfInfarmation.valueLabel.text = meal?.name
            case 1:
                cellOfInfarmation.keyLabel.text = "Описание:"
                cellOfInfarmation.valueLabel.text = meal?.notes
            case 2:
                cellOfInfarmation.keyLabel.text = "Рейтинг:"
                if let rating = meal?.rating {
                    switch rating {
                    case 5:
                        cellOfInfarmation.valueLabel.textColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
                    case 4:
                        cellOfInfarmation.valueLabel.textColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
                    case 3:
                        cellOfInfarmation.valueLabel.textColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
                    case 2:
                        cellOfInfarmation.valueLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    default:
                        cellOfInfarmation.valueLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                    }
                    cellOfInfarmation.valueLabel.text = "\(rating)"
                }
            default:
                break
            }
        
            return cellOfInfarmation
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
