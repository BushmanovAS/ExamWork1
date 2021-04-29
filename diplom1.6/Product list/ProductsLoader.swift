//
//  ProductLoader.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 19.07.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import Foundation

class ProductsLoader {
        
    func loadProducts(id: String, completion: @escaping ([Products]) -> Void) {
        let urlString = "http://blackstarshop.ru/index.php?route=api/v1/products&cat_id=\(id)"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            guard error == nil else { return }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let jsonDict = json as? NSDictionary
            print(json)
            var products: [Products] = []
            
            for (_, data) in jsonDict! where data is NSDictionary {
                if let product = Products(data: data as! NSDictionary) {
                    products.append(product)
                }
            }
            
            DispatchQueue.main.async {
                completion(products)
            }
            
        }
        task.resume()
    }
}
