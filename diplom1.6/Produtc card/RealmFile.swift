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
    
    func getAllTask() -> Results<TrashRealm> {
        return realm.objects(TrashRealm.self)
    }

    func addTask(task: TrashRealm) {
        try! realm.write {
            realm.add(task)
        }
    }

    func deleteTask(task: Object) {
        try! realm.write {
            realm.delete(task)
        }
    }    
}

