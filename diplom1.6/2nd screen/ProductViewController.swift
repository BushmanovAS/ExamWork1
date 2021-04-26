//
//  ProductViewController.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 19.07.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var products: [Products] = []
    let loader = ProductsLoader()
    var id = ""

    override func viewWillAppear(_ animated: Bool) {
        
        loader.loadProducts(id: self.id) { (data) in
            self.products = data
            self.collectionView.reloadData()
    }
    }
}






extension ProductViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        let model = products[indexPath.row]
        cell.productNameLabel.text = model.name
        cell.productPriceLabel.text = "\(model.price) ₽"
        
        guard let imageURL = URL(string:("http://blackstarshop.ru/" + model.mainImage)) else {return cell}
        cell.productImage.sd_setImage(with: imageURL, completed: nil)
        
        func segue() {
            performSegue(withIdentifier: "ShowProductCard", sender: indexPath.row)
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowProductCard", sender: indexPath.row)
    }
}
