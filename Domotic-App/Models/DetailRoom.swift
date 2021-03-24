//
//  DetailRoom.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 24/3/21.
//

import Foundation
import ObjectMapper

struct DetailRoom: ImmutableMappable{
    
    var light: String?
    var blinds: String?
    var door: String?
    var air: Air?
    
    init(map: Map) throws {
        light = try map.value("light")
        blinds = try map.value("blinds")
        door = try map.value("door")
        air = try map.value("air")
    }
}

struct Air: ImmutableMappable{
    
    var power: String
    var temp: Int
    
    init(map: Map) throws {
        power = try map.value("power")
        temp = try map.value("temp")
    }
}
