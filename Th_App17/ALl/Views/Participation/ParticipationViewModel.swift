//
//  ParticipationViewModel.swift
//  Th_App17
//
//  Created by IGOR on 25/01/2025.
//

import SwiftUI
import CoreData

final class ParticipationViewModel: ObservableObject {

    @Published var startStar: Int = 1

    @Published var categories: [String] = ["Career and Work", "Creativity and Arts", "Cultural Events", "Educational Events", "International Programs", "Scientific Conferences", "Social Events", "Sports Events", "Technology Events", "Volunteering"]
    @Published var currentCat = "Career and Work"

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false

    @Published var pCat: String = ""
    @Published var pName: String = ""
    @Published var pDate: Date = Date()
    @Published var pImp: String = ""
    @Published var pNot: String = ""

    @Published var participants: [PartModel] = []
    @Published var selectedPart: PartModel?

    func addPart() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "PartModel", into: context) as! PartModel

        loan.pCat = pCat
        loan.pName = pName
        loan.pDate = pDate
        loan.pImp = pImp
        loan.pNot = pNot

        CoreDataStack.shared.saveContext()
    }

    func fetchParts() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<PartModel>(entityName: "PartModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.participants = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.participants = []
        }
    }
}
