import Foundation

class Category {
    var name: String
    var image: String
    var iconImage: String
    var iconImageActive: String
    var subcategories: NSArray
    
    init?(data: NSDictionary) {
        
        guard let name = data["name"] as? String,
            let image = data["image"] as? String,
            let iconImage = data["iconImage"] as? String,
            let iconImageActive = data["iconImageActive"] as? String,
            let subcategories = data["subcategories"] as? NSArray
        else {
            return nil
        }
        
        self.name = name
        self.image = image
        self.iconImage = iconImage
        self.iconImageActive = iconImageActive
        self.subcategories = subcategories
    }
    
    func metod() -> [Subcategory] {
        var subcategories1: [Subcategory] = []
        
        for item in subcategories{
            if let sub = Subcategory(data: item as! NSDictionary)
            {subcategories1.append(sub)}
        }
        return subcategories1
    }
}

class Subcategory {
    var id: String
    var iconImage: String
    var name: String
    
    init?(data: NSDictionary) {
        
        guard let name = data["name"] as? String,
              let iconImage = data["iconImage"] as? String,
              let id = data["id"] as? String
        else {
            return nil
        }
        
        self.name = name
        self.iconImage = iconImage
        self.id = id
    }
    

}

