//
//  DelegateTraining.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 01.11.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit


// Задача передать данные из FirstViewController B SecondViewController при помощи делегата

protocol FirstViewControlleDelegate {    //создаем протокол делегирования с обязательным методом
    func passData(data: String)          //и параметром типа String
}





class FirstViewController { //FirstViewController имеет опциональное свойство delegate, тип которого FirstViewControlleDelegate. Свойство делегата будет инициализировано классом SecondViewController. Данный класс будет соответствовать протоколу FirstViewControlleDelegate.
    
    var delegate: FirstViewControlleDelegate?
    
    
    let second = SecondViewController()
    
    
}







class SecondViewController: FirstViewControlleDelegate {
    
    let first = FirstViewController()
    
    func viewDidLoad() {
        
        first.delegate = second
        
    }
    
    func passData(data: String) {
        print(data)
    }
    
    
    
    
}
