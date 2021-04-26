//
//  RealmFile.swift
//  diplom1.6
//
//  Created by Антон Бушманов on 24.10.2020.
//  Copyright © 2020 Антон Бушманов. All rights reserved.
//

import UIKit
import RealmSwift



class TrashRealm: Object {
    
    @objc dynamic var image = ""
    @objc dynamic var name = ""
    @objc dynamic var size = ""
    @objc dynamic var color = ""
    @objc dynamic var price = ""
    
}

class RealmService {
    static let shared = RealmService()
    
    private let realm = try! Realm()
    
    func getAllTask() -> Results<TrashRealm>{   // что в принципе делает эта запись ?
        return realm.objects(TrashRealm.self)
    }
    // Функция записи в БД реалма
    func addTask(task: TrashRealm) {
        try! realm.write {
            realm.add(task)
        }
    }
    // Функция удаления из БД реалма
    func deleteTask(task: Object) {
        try! realm.write {
            realm.delete(task)
        }
    }
    
}

