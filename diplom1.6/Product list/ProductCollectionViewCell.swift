//
//  ProductCollectionViewCell.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 19.07.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBuyButton: UIButton!
    @IBOutlet weak var productPriceLabel: UILabel!
    let a = ProductViewController()
    @IBAction func buyButton(_ sender: Any) {
    }    
}
