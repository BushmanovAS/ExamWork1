//
//  CategoryTableViewCell.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 28.06.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
