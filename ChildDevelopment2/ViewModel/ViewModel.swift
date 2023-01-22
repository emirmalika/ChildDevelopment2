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
    
    @Published var physicalGamesList = [Games]()
    @Published var fMotorGamesList = [Games]()
    @Published var logicalGamesList = [Games]()
    @Published var speechGamesList = [Games]()
    @Published var sensoryGamesList = [Games]()
    @Published var householdGamesList = [Games]()
    @Published var creativeGamesList = [Games]()
    @Published var emotionalGamesList = [Games]()
    
    @Published var physicalDescr = []
    @Published var fMotorDescr = []
    @Published var logicalDescr = []
    @Published var speechDescr = []
    @Published var sensoryDescr = []
    @Published var householdDescr = []
    @Published var creativeDescr = []
    @Published var emotionalDescr = []
   
    
    func getData(section: String) {
        
        let database = Firestore.firestore()
        
        database.collection(section).getDocuments { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async { 
                        if section == "physicalGames" {
                            
                            self.physicalGamesList = snapshot.documents.map { data in
                                self.physicalDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.physicalDescr, forKey: "PhysicalDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                           
                        } else if section == "fMotorGames" {
                            
                            self.fMotorGamesList = snapshot.documents.map { data in
                                self.fMotorDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.fMotorDescr, forKey: "FMotorDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                            
                        } else if section == "logicalGames" {
                            self.logicalGamesList = snapshot.documents.map { data in
                                self.logicalDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.logicalDescr, forKey: "LogicalDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                            
                        } else if section == "speechGames" {
                            
                            self.speechGamesList = snapshot.documents.map { data in
                                self.speechDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.speechDescr, forKey: "SpeechDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                        
                        } else if section == "sensoryGames" {
                        
                            self.sensoryGamesList = snapshot.documents.map { data in
                                self.sensoryDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.sensoryDescr, forKey: "SensoryDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                            
                        } else if section == "householdGames" {
                            
                            self.householdGamesList = snapshot.documents.map { data in
                                self.householdDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.householdDescr, forKey: "HouseholdDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                            
                        } else if section == "creativeGames" {
                            
                            self.creativeGamesList = snapshot.documents.map { data in
                                self.creativeDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.creativeDescr, forKey: "CreativeDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                            
                        } else {
                            
                            self.emotionalGamesList = snapshot.documents.map { data in
                                self.emotionalDescr.append(data["descr"] as! String)
                                UserDefaults.standard.set(self.emotionalDescr, forKey: "EmotionalDescr")
                                return Games(id: data.documentID, description: data["descr"] as? String ?? "")
                            }
                            
                        }
    
                    }
                }
            }
            
        }
    }
    
    
    
    
}
