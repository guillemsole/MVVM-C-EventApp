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
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        event.setValue(date, forKey: "date")
        
        let resizedImage = image.sameAspectRatio(newHeight: 250)
        let imageData = resizedImage.jpegData(compressionQuality: 0.5)
        event.setValue(imageData, forKey: "image")
        
        do {
            try moc.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let event = try moc.fetch(fetchRequest)
            return event
        } catch {
            print(error)
            return []
        }
    }
}
