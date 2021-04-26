//
//  ProductClass.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 19.07.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import Foundation

class Products {
    var name: String
    var article: String
    var description: String
    var colorName: String
    var colorImageURL: String
    var mainImage: String
    var productImages: NSArray
    var offers: NSArray
    var price: String
//    var attributes: NSArray
 
    
    init?(data: NSDictionary) {
        guard let name = data["name"] as? String,
            let article = data["article"] as? String,
            let description = data["description"] as? String,
            let colorName = data["colorName"] as? String,
            let colorImageURL = data["colorImageURL"] as? String,
            let mainImage = data["mainImage"] as? String,
            let price = data["price"] as? String,
            let productImages = data["productImages"] as? NSArray,
            let offers = data["offers"] as? NSArray
//        let attributes = data["attributes"] as? NSArray
            else {return nil}
        
        self.name = name
        self.article = article
        self.description = description
        self.colorName = colorName
        self.colorImageURL = colorImageURL
        self.mainImage = mainImage
        self.productImages = productImages
        self.offers = offers
        self.price = price
//        self.attributes = attributes
        
        
    }
    
    func metod2() -> [ProductImages] {
        
        var productImages1: [ProductImages] = []
        
        for item in productImages{
            if let prod = ProductImages(data: item as! NSDictionary)
            {productImages1.append(prod)}
        }
        return productImages1
}
    func metod3() -> [Offers] {
        
        var offers1: [Offers] = []
        
        for item in offers{
            if let prod = Offers(data: item as! NSDictionary)
            {offers1.append(prod)}
        }
        return offers1
    
    }
}



class ProductImages {
    var imageURL: String
    
    init?(data: NSDictionary) {
        
        guard let imageURL = data["imageURL"] as? String
            else{return nil}
        
        self.imageURL = imageURL
    }
}

class Offers {
    var size: String
    var quantity: String
    
    init?(data: NSDictionary) {
        
        guard let size = data["size"] as? String,
            let quantity = data["quantity"] as? String
            else{return nil}
        
        self.size = size
        self.quantity = quantity
}
}
/*
class Attributes {
{
    "Декоративный элемент": "принт"
    },
    {
    "Рисунок": " надпись"
    },
    {
    "Сезон": "круглогодичный"
    },
    {
    "Страна производителя": "Россия"
    }
    ]
}
*/
