//
//  MealListDetailTableViewCell.swift
//  MVC
//
//  Created by Timur Saidov on 07/10/2018.
//  Copyright © 2018 Timur Saidov. All rights reserved.
//

import UIKit

class MealListDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var mealDetailImageView: UIImageView!
    @IBOutlet weak var mealDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
