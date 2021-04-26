//
//  ProductCardViewController.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 02.08.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit

class ProductCardViewController: UIViewController {

    @IBOutlet weak var productCardImage: UIImageView!
    
    @IBOutlet weak var productCardNameLabel: UILabel!
    
    @IBOutlet weak var productCardPriceLabel: UILabel!
    
    
    @IBOutlet weak var productCardDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    
    @IBAction func productCardAddButton(_ sender: Any) {
    }
    
    @IBAction func productCardChangeButton(_ sender: Any) {
    }
    
}
