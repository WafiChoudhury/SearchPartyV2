//
//  TrendingModel.swift
//  QuikNews
//
//  Created by Wafi Choudhury on 4/15/22.
//

import Foundation

struct PartyModel: Identifiable{
    
    var image: String
    var price: Double?
    var title: String
    var description: String?
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var id: String?
    var capacity: Int
    var attendees:Int
    
    enum CodingKeys: String, CodingKey {

        case image
        case price
        case title
        case description
        case latitude
        case longitude
        case location
        case adress
        case id
        case capacity
        case attendees

      }
    var dictionary: [String: Any] {
       return [
         "image": image,
         "price": price ?? 0.0,
         "title": title,
         "description": description ?? "A really cool party",
         "latitude":latitude ?? 30.28423,
         "longitude": longitude ?? -97.74471,
         "address": address ?? "2101 Rio Grande St",
         "id": id,
         "capacity":capacity,
         "attendees" : attendees
         
       ]
     }

    
}
