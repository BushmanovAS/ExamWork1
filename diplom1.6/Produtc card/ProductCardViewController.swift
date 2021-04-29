//
//  ProductCardViewController.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 02.08.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit



class ProductCardViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var productCardCollectionView: UICollectionView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var offersTableView: UITableView!
    @IBOutlet weak var offersView: UIView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var productCardNameLabel: UILabel!
    @IBOutlet weak var productCardPriceLabel: UILabel!
    @IBOutlet weak var productCardDescriptionLabel: UILabel!
    var isOffersOpen = false
    var product: Products!
    var array: NSArray = []
    var offersArray: NSArray = []
    var gallery: [String] = []
    var size: [String] = []
    var quantity: [String] = []
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewWillAppear(_ animated: Bool) {
        offersView.isHidden = true
        topConstraint.constant = UIScreen.main.bounds.height
        gallery.removeAll()
        size.removeAll()
        productCardNameLabel.text = "\(product.name)"
        productCardPriceLabel.text = "\(Int(Double(product.price) ?? 0)) ₽"
        productCardDescriptionLabel.text = "\(product.description)"
        array = product.productImages
        offersArray = product.offers
        
        for i in 0..<offersArray.count {
            let nsarr = offersArray[i] as! NSDictionary
            let size1 = nsarr["size"] as! String
            let quantity1 = nsarr["quantity"] as! String
            let size2 = size1
            let quantity2 = quantity1
            size.append(size2)
            quantity.append(quantity2)
        }
        
        print(size)
        print(quantity)
        
        for i in 0..<array.count {
            let nsarr = array[i] as! NSDictionary
            let imgUrl = nsarr["imageURL"] as! String
            let imgUrl2 = "http://blackstarshop.ru/" + imgUrl
            gallery.append(imgUrl2)
        }
        
        print(gallery.count)
        imagePageControl.numberOfPages = gallery.count
        offersTableView.reloadData()
 }
      
    @IBAction func inTrashButton(_ sender: Any) {
    }
    
    @IBAction func productCardAddButton(_ sender: Any) {
        
        UIView.animate(withDuration: 1.3) {
            self.offersView.isHidden = self.isOffersOpen ? true : false
            self.topConstraint.constant = self.isOffersOpen ? (UIScreen.main.bounds.height) : 0
        }
        
        isOffersOpen = !isOffersOpen
    }
}

extension ProductCardViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
       
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCardCell", for: indexPath) as! ProductCardCollectionViewCell
        
        if gallery.count == 0 {
            cell.productCardImage.image = UIImage(named: "noImage")
        } else {
            let imageURL = URL(string:gallery[indexPath.row])
            cell.productCardImage.sd_setImage(with: imageURL, completed: nil)
        }
        return cell
    }
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        imagePageControl.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = UIScreen.main.bounds.width
        let h = UIScreen.main.bounds.height / 2
        return CGSize(width: w, height: h)
    }
}
    
extension ProductCardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return size.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = offersTableView.dequeueReusableCell(withIdentifier: "OffersCell") as! ProductOffersTableViewCell
        cell.sizeLabel.text = size[indexPath.row]
        cell.quantityLabel.text  = "\(quantity[indexPath.row]) шт."
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = offersTableView.dequeueReusableCell(withIdentifier: "OffersCell") as! ProductOffersTableViewCell
        let trash = TrashRealm()
        
        if gallery.count > 0 {
            trash.image = gallery[0]
        } else {
            trash.image = "noImage"
        }
        
        trash.name = product.name
        trash.price = product.price
        trash.size = size[indexPath.row]
        RealmService.shared.addTask(task: trash)
                
        UIView.animate(withDuration: 1.3) {
            self.offersView.isHidden = self.isOffersOpen ? true : false
            self.topConstraint.constant = self.isOffersOpen ? (UIScreen.main.bounds.height) : 0
        }
        
        isOffersOpen = !isOffersOpen
    }    
}

