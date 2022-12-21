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
    var id: String
    
    
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
        
      }
    

    
}