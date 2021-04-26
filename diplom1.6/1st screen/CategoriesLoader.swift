//
//  CategoriesLoader.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 28.06.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import Foundation

class CategoriesLoader {
    
    
    func loadCategories(completion: @escaping ([Category]) -> Void) {
        let urlString = "http://blackstarshop.ru/index.php?route=api/v1/categories"
        guard let url = URL(string: urlString) else {return}
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {return}
            guard error == nil else {return}
            let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let jsonDict = json as? NSDictionary
            print(json)
            
            var categories: [Category] = []
            
            for (_, data) in jsonDict! where data is NSDictionary {
                if let category = Category(data: data as! NSDictionary)
                {categories.append(category)}
            
            }
            
            DispatchQueue.main.async {
                completion(categories)

            }
            print(categories.count)
            
        }
        task.resume()
    }
    
}

