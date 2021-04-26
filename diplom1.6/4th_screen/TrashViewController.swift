//
//  BasketViewController.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 07.10.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit

class TrashViewController: UIViewController {

    func totalPrice () {
        for i in items {
            let i2 = i.price
            let i3 = Int(Double(i2) ?? 0)
            sum += i3
        }
    }
    
    
    
    var sum = 0
    @IBOutlet weak var trashLabel: UILabel!
    @IBOutlet weak var trashTableView: UITableView!
    var items = RealmService.shared.getAllTask()
    
    override func viewDidAppear(_ animated: Bool) {
 
    items = RealmService.shared.getAllTask() // обновление данных из реалма
    sum = 0
    totalPrice()                             // функция суммы покупок в корзине
    trashTableView.reloadData()              // обновление данных таблицы корзины
        
    }


    @IBAction func trashButton(_ sender: Any) {   // кнопка перехода из карточки товара в корзину
        
    }
}

extension TrashViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrashCell") as! TrashTableViewCell
        
        cell.initCell(item: items[indexPath.row], index: indexPath.row)
        
        cell.delegate = self
        
        trashLabel.text = "\(sum) ₽"
        
        return cell
    }
    
    
}

extension TrashViewController: TrashTableViewCellDelegate {
    
    func abc() {
        items = RealmService.shared.getAllTask()
        sum = 0
        totalPrice()
        trashTableView.reloadData()
    }
    
    
}
