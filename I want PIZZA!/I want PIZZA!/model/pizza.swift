//
//  pizza.swift
//  I want PIZZA!
//
//  Created by HSE  FKN on 30.03.2021.
//

import Foundation

//enum Cheeses: Decodable {
//    case threeCheeses, parmezan
//    init(from decoder: Decoder) throws {
//    }
//}
//
//enum Additionals: Decodable {
//    case superHot, extraCheese
//    case nothing(value: String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        let status = try? container.decode(String.self)
//        switch status {
//        case "superHot": self = .superHot
//        case "extraCheese": self = .extraCheese
//              default:
//                     self = .nothing(value: status ?? "nothing")
//        }
//
//    }
//}

//TODO: images, descriptions

struct Pizza : Identifiable, Encodable, Decodable, Hashable {
    var id = UUID()
    var date: Date = Date.init() // date of order
    var title: String // pizza's name
    var description: String // pizza's text
}


