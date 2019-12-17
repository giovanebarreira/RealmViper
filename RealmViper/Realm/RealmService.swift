//
//  RealmService.swift
//  RealmViper
//
//  Created by giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmService {
    
    private init(){}
    static let shared = RealmService()
    
    
    func getDataFromRealm<T: RealmObjectModel>() -> Results<T>{
        let realm = try! Realm()
        let results: Results<T> = realm.objects(T.self)
        
        return results
    }
    
    //Generic class - > can pass any subclasses of Realm objec REUSABLE
    func create<T: RealmObjectModel>(_ object: T){
        let realm = try! Realm()
        do{
            try realm.write {
                realm.add(object)
            }
        } catch {
            NSLog("\(error)")// handle the error
        }
    }
    
    func update<T: RealmObjectModel>(_ object: T, with dictionary: [String : Any?]){
        let realm = try! Realm()
        do{
            try realm.write {
                //Will change every value based on key
                for(key, value) in dictionary{
                    RealmObjectModel.setValue(value, forKey: key)
                }
            }
        } catch {
            NSLog("\(error)")
        }
    }
    
    func delete<T: RealmObjectModel>(_ object: T){
        let realm = try! Realm()
        do{
            try realm.write {
                realm.delete(object)
            }
        } catch {
            NSLog("\(error)")
        }
    }
    
  
}
