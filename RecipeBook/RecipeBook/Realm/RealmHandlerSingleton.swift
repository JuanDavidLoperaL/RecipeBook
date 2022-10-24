//
//  RealmHandlerSingleton.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation
import RealmSwift

final class RealmHandlerSingleton {
    
    // MARK: - Static Properties
    static let shared: RealmHandlerSingleton = RealmHandlerSingleton()
    
    // MARK: - Internal Properties
    var realmDatabase: Realm?
    
    // MARK: - Private Init
    private init() {
        realmDatabase = try? Realm()
    }
    
    func getRecipesSaved() -> [RecipeViewData] {
        var recipes: [RecipeViewData] = [RecipeViewData]()
        realmDatabase?.objects(RecipeViewData.self).forEach({ recipeViewData in
            recipes.append(recipeViewData)
        })
        return recipes
    }
    
    func save(object: RecipeViewData, callback: (_ didSaveObject: Bool) -> Void) {
        do {
            try realmDatabase?.write({
                realmDatabase?.add(object)
                callback(true)
            })
        } catch {
            callback(false)
        }
    }
    
    func delete(object: RecipeViewData, callback: (_ didDeleteObject: Bool) -> Void) {
        do {
            try realmDatabase?.write({
                realmDatabase?.delete(object)
                callback(true)
            })
        } catch {
            callback(false)
        }
    }
    
    func deleteAll() {
        do {
            try realmDatabase?.write({
                realmDatabase?.deleteAll()
            })
        } catch {
        }
    }
}
