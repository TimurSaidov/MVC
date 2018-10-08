//
//  MealListTableViewController.swift
//  MVC
//
//  Created by Timur Saidov on 07/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    
    var meals: [Meal] = [] // Связь Controller-Model.

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMeals()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if !meals.isEmpty {
            return meals.count
        }
        return 0
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MealListTableViewCell

        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        let mealDate = meal.timestamp
        cell.dateLabel.text = DateFormatter.localizedString(from: mealDate, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
        cell.mealImageView.image = UIImage(named: meal.photo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Подготовка к переходу на DetailViewController. При нажатии на ячейку, вызывается данный метод.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                guard let dvc = segue.destination as? MealListDetailViewController else { return }
                let meal = meals[indexPath.row]
                dvc.meal = meal
            }
        }
    }
    
    func loadMeals() {
        meals += [
            Meal(name: "Воппер", photo: "vopper.png", notes: "Воппер - это вкуснейшая приготовленная на огне 100% говядина с сочными помидорами, свежим нарезанным листовым салатом, густым майонезом, томатным кетчупом, хрустящими маринованными огурчиками и свежим луком на нежной булочке с кунжутом.", rating: 3, timestamp: Date()),
            Meal(name: "Беконайзер", photo: "bekonaizer.png", notes: "Встречай самый внушительный бургер в коллекции Бургер Кинг. Бекон, двойная порция говядины на гриле, много сыра - все, как ты любишь, и ничего лишнего!", rating: 5, timestamp: Date()),
            Meal(name: "Биг Кинг", photo: "bigking.png", notes: "Больше 100% говядины. Больше сыра. Больше соуса. Кроме двух фирменных бифштексов и ломтика сыра в состав входят фирменный соус «Кинг», листовой салат, маринованные огурчики, свежий лук — и все это на подрумяненной булочке с кунжутом.", rating: 4, timestamp: Date()),
            Meal(name: "Стейкхауc", photo: "steikhaus.png", notes: "Стейкхаус – это сочетание нашей фирменной, приготовленной на огне 100% говядины с ломтиками бекона и соусом «Барбекю», майонезом, листьями свежего салата, помидором и хрустящим луком на воздушной булочке, посыпанной кукурузной крошкой.", rating: 5, timestamp: Date()),
            Meal(name: "Чизбургер", photo: "chizburger", notes: "Вы не ошибетесь, выбирая Чизбургер: это фирменный приготовленный на огне бифштекс из 100% говядины с ломтиком слегка расплавленного сыра, хрустящим маринованным огурчиком, горчицей и кетчупом, которые подаются в подрумяненной булочке с кунжутом.", rating: 4, timestamp: Date())]
    }

}
