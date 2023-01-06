//
//  ViewModel.swift
//  ChildDevelopment2
//
//  Created by Malik Em on 05.01.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class ViewModel: ObservableObject {
    
    @Published var listOne = [Games]()
    @Published var listTwo = [Games]()
    @Published var listThree = [Games]()
    
    func getData(section: String) {
        
        let database = Firestore.firestore()
        
        database.collection(section).getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        if section == "physicalGames" {
                            self.listOne = snapshot.documents.map { data in
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                        } else if section == "logicalGames" {
                            self.listTwo = snapshot.documents.map { data in
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                        } else {
                            self.listThree = snapshot.documents.map { data in
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                        }
        
                    }
                }
            }
            else {
                
            }
        }
    }
}
