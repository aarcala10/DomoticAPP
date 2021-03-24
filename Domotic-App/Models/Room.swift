//
//  Room.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//

import Foundation
import ObjectMapper

struct Room: ImmutableMappable {
    
    var id: Int
    var name: String
    
    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
    }
    
    func mapping(map: Map) {
        id   >>> map["id"]
        name >>> map["name"]
    }
}
