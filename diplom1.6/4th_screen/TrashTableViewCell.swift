//
//  TrashTableViewCell.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 26.10.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit

protocol TrashTableViewCellDelegate {
    func abc ()
}


class TrashTableViewCell: UITableViewCell {
    
    var delegate: TrashTableViewCellDelegate?

    var numberDelete = 0
    var deleteItem: TrashRealm!
    
    @IBOutlet weak var trashImage: UIImageView!
    
    @IBOutlet weak var trashName: UILabel!
    @IBOutlet weak var trashSize: UILabel!
    @IBOutlet weak var trashColor: UILabel!
    @IBOutlet weak var trashPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell (item: TrashRealm, index: Int) {
        
        trashImage.contentMode = UIView.ContentMode.scaleAspectFit
        
        if item.image == "noImage"{
            trashImage.image = UIImage(named: "noImage")
        }else{
        let imageURL = URL(string: item.image)
        trashImage.sd_setImage(with: imageURL, completed: nil)
        }
        trashName.text = item.name
        trashSize.text = "Размер: \(item.size)"
        trashPrice.text = "Цена: \(Int(Double(item.price) ?? 0)) ₽"
        trashColor.text = "Цвет: -"
        
        numberDelete = index
        deleteItem = item
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func trashDeleteButton(_ sender: Any) {
        

        RealmService.shared.deleteTask(task: deleteItem )
        delegate?.abc()
    }
}
