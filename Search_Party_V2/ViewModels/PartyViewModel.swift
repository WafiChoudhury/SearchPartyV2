//
//  NewsViewModel.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 5/27/22.
//

import Foundation
import FirebaseFirestore
import Firebase
import CoreLocation

class PartyViewModel: NSObject, CLLocationManagerDelegate, ObservableObject  {
    
    
    
    @Published var parties = [PartyModel]()
    @Published var saved = [PartyModel]()
    var locationManager = CLLocationManager()
    @Published var authorizationState = CLAuthorizationStatus.notDetermined

    override init(){
        
        super.init()
        parties.append(PartyModel(image: "Omega", price: 10, title: "Omegas Party", description: "party", latitude: 0.0, longitude: 0.0, address: "some house", id: "seshsh", capacity: 100, attendees: 10))
        
        self.saved.append(PartyModel(image: "Omega", price: 10, title: "Omegas Party", description: "party", latitude: 0.0, longitude: 0.0, address: "some house", id: "seshsh", capacity: 100, attendees: 10))
    }
    
    
    func requestGeoLocationPermission(){
        //get permission from user and then geolocate them
        locationManager.requestWhenInUseAuthorization()
        
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            
            // Update the authorizationState property
            authorizationState = locationManager.authorizationStatus
            
            if locationManager.authorizationStatus == .authorizedAlways ||
                locationManager.authorizationStatus == .authorizedWhenInUse {
                
                // We have permission
                // Start geolocating the user, after we get permission
                locationManager.startUpdatingLocation()
            }
            else if locationManager.authorizationStatus == .denied {
                // We don't have permission
            }
        }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //gives us the location of the user
        let userLocation = locations.first
        
        if(userLocation != nil){
            
            //stop updating
            locationManager.stopUpdatingLocation()
            
            print("hey")
            }
        
        
        }

    
   
    func fetchParties(){
        
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        let db = Firestore.firestore()
        db.collection("Parties").addSnapshotListener { (querySnapshot, error) in
            
            //check errors
            
            //handle changes
            
            guard let documents = querySnapshot?.documents else {
                
                print("error")
                return
            }
            self.parties = documents.map{ (QueryDocumentSnapshot) -> PartyModel in
                
                let data = QueryDocumentSnapshot.data()
                let img = data["image"] as? String ?? ""
                let price = data["price"] as? Double ?? 0.0
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? "fun party"
                let lat = data["latitude"] as? Double ?? 0.0
                let lon = data["longitude"] as? Double ?? 0.0
                let adress = data["adress"] as? String ?? "fun party"
                let cap = data["capacity"] as? Int ?? 0
                let atend = data["atendees"] as? Int ?? 0
                
                let id = data["id"] as? String ?? ""
                return PartyModel(image: img, price: price, title: title, description: description, latitude: lat, longitude: lon, address: adress, id: id, capacity: cap, attendees: atend) 
                
            }

        }
    }
    
    func fetchSaved(){
        
        
        
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        
        
        //check errors
        let db = Firestore.firestore()
        let usersRef = db.collection("users")
        let firstElement = saved.first!
        saved.removeAll()
        saved.append(firstElement)
        
        if let currentUserID = Auth.auth().currentUser?.uid {
            let currentUserRef = usersRef.document(currentUserID)
            
            currentUserRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    // Access the array
                    let myArray = document.data()?["saved"] as? [String]
                    // Access an element of the array
                    if let myArray = myArray {
                        for element in myArray {
                            
                            self.addSaved(uid: element)
                        }
                    }
                } else {
                    print("Document does not exist")
                }
            }
            
        }
    
    }
    
    
    func addSaved(uid:String){
        //check errors
        let db = Firestore.firestore()
        let partiesRef = db.collection("Parties")
        
        // Get all the parties in the collection
        partiesRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting parties: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    // Get the data for the current party
                    let data = document.data()
                    // Check if the uid matches the target uid
                    if data["id"] as? String == uid {
                        // Add the party to the array of saved parties
                        let img = data["image"] as? String ?? ""
                        let price = data["price"] as? Double ?? 0.0
                        let title = data["title"] as? String ?? ""
                        let description = data["description"] as? String ?? "fun party"
                        let lat = data["latitude"] as? Double ?? 0.0
                        let lon = data["longitude"] as? Double ?? 0.0
                        let adress = data["adress"] as? String ?? "fun party"
                        let cap = data["capacity"] as? Int ?? 0
                        let atend = data["atendees"] as? Int ?? 0
                        
                        let id = data["id"] as? String ?? ""
                    
                        self.saved.append(PartyModel(image: img, price: price, title: title, description: description, latitude: lat, longitude: lon, address: adress, id: id, capacity: cap, attendees: atend))
                    }
                }
            }
        }
        
        
        
    }
    
    
}



