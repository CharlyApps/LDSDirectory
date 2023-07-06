//
//  IndividualsViewModel.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject {
    @Published var individuals: [Individual] = []
    
    func fetchDirectory(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<IndividualEntity> = IndividualEntity.fetchRequest()
        let sortById = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortById]
        do {
            let entities = try context.fetch(fetchRequest)
            if !entities.isEmpty {
                if individuals.isEmpty {
                    for individual in entities {
                        let model = Individual(entity: individual)
                        individuals.append(model)
                    }
                }
                return
            }

        } catch {
            print("Error fetching: \(error.localizedDescription)")
        }
        
        guard let url = URL(string:"https://edge.ldscdn.org/mobile/interview/directory") else {
            return
        }
        let urlTask = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data , error == nil else {
                return
            }
            
            do {
                let individualsData = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    if let entries = individualsData.individuals {
                        self?.individuals = entries
                        self?.saveData(context: context)
                    }
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        urlTask.resume()
    }
    
    func saveData(context: NSManagedObjectContext) {
        individuals.forEach { data in
            let entity = IndividualEntity(context: context)
            entity.firstName = data.firstName
            entity.lastName = data.lastName
            entity.affiliation = data.affiliation.rawValue
            entity.forceSensitive = data.isForceSensitive
            entity.profilePicture = data.profilePicture
            entity.birthdate = data.birthdate
            entity.id = Int32(data.id)
        }
        
        do {
            try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
        
    }
}
