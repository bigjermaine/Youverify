//
//  DessertCoredataViewmodel.swift
//  Youverify
//
//  Created by Daniel Jermaine on 13/03/2025.
//



import Foundation
import CoreData
import SwiftUI

class DessertCoreDataViewmodel:ObservableObject {
    @Published  var cartCount = 0
    let container:NSPersistentContainer

    @Published var savedEntity: [DessertEntity] = []

    init(){
        container = NSPersistentContainer(name: "Dessert")
        container.loadPersistentStores { description, error in
            if let error = error  {
                print(error.localizedDescription)
            }else {
                print("sucess")
            }
        }
        fetchbooking()
    }
    ///fetch the request
    func fetchbooking() {
        let request =  NSFetchRequest<DessertEntity>(entityName:"DessertEntity")
        
        do{
            savedEntity = try container.viewContext.fetch(request)
        }catch let error {
            print(error.localizedDescription)
        }
        
    }
    
    ///add the booking
    func addBooking(Name:String) {
        let newBooking = DessertEntity(context: container.viewContext)
        newBooking.name = Name
        
        saveBooking()
    }
    ///delete the Delete
    func delete(index:IndexSet) {
        guard let index = index.first else {return}
        let entity = savedEntity[index]
        container.viewContext.delete(entity)
        saveBooking()
    }
    ///save the booking
    func saveBooking() {
        do {
            try  container.viewContext.save()
            fetchbooking()
        }catch{
            print(error.localizedDescription)
        }
    }
}


