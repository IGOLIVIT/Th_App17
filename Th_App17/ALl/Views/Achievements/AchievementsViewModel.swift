//
//  AchievementsViewModel.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI
import CoreData

final class AchievementsViewModel: ObservableObject {
    
    @Published var categories: [String] = ["Academics", "Creative Arts", "Languages & Linguistics", "Personal Growth", "Public Speaking & Debate", "Research & Science", "Sports & Fitness", "Technology & Coding", "Volunteering & Community Service"]
    @Published var currentCategory = "Academics"
        
    @Published var addName: String = ""
    @Published var addNG: String = ""
    @Published var addNW: String = ""
    @Published var addNS: String = ""
    
    @Published var startStar: Int = 1

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDetail: Bool = false

    @Published var aCat: String = ""
    @Published var aName: String = ""
    @Published var aDate: Date = Date()
    @Published var aImp: String = ""
    @Published var aNot: String = ""

    @Published var achievements: [AchModel] = []
    @Published var selectedAch: AchModel?

    func addAch() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AchModel", into: context) as! AchModel

        loan.aCat = aCat
        loan.aName = aName
        loan.aDate = aDate
        loan.aImp = aImp
        loan.aNot = aNot

        CoreDataStack.shared.saveContext()
    }

    func fetchAchs() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AchModel>(entityName: "AchModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.achievements = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.achievements = []
        }
    }

}
