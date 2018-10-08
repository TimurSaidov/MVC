//
//  MealListTableViewCell.swift
//  MVC
//
//  Created by Timur Saidov on 07/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class MealListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
