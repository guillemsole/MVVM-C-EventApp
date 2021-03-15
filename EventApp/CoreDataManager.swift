//
//  CoreDataManager.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func get<T: NSManagedObject>(_ id: NSManagedObjectID) -> T? {
        do {
            return try moc.existingObject(with: id) as? T
        } catch {
            print(error)
        }
        return nil
    }
    
    func getAll<T: NSManagedObject>() -> [T] {
        do {
            let fetchRequest = NSFetchRequest<T>(entityName: "\(T.self)")
            return try moc.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func save() {
        do {
            try moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
//    func updateEvent(event: Event, name: String, date: Date, image: UIImage) {
//        event.setValue(name, forKey: "name")
//        event.setValue(date, forKey: "date")
//
//        let resizedImage = image.sameAspectRatio(newHeight: 250)
//        let imageData = resizedImage.jpegData(compressionQuality: 0.5)
//        event.setValue(imageData, forKey: "image")
//
//
//    }
//
//    func saveEvent(name: String, date: Date, image: UIImage) {
//        let event = Event(context: moc)
//        event.setValue(name, forKey: "name")
//        event.setValue(date, forKey: "date")
//
//        let resizedImage = image.sameAspectRatio(newHeight: 250)
//        let imageData = resizedImage.jpegData(compressionQuality: 0.5)
//        event.setValue(imageData, forKey: "image")
//
//        do {
//            try moc.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func fetchEvents() -> [Event] {
//        do {
//            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
//            let event = try moc.fetch(fetchRequest)
//            return event
//        } catch {
//            print(error)
//            return []
//        }
//    }
}
