//
//  Character.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 25.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct Character: Decodable{
    
    let name: String
    var homeworld: String?
    let image: String
    let height: Double?
    let gender: String
    let eyeColor: String?
    let skinColor: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case homeworld
        case image
        case height
        case gender
        case eyeColor
        case skinColor
    }
    
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        image = try container.decode(String.self, forKey: .image)
        homeworld = try? container.decode(String.self, forKey: .homeworld)
        
        if homeworld == nil {
            homeworld = try? container.decode([String].self, forKey: .homeworld).joined(separator: ", ")
        }
        
        gender = try container.decode(String.self, forKey: .gender)
        height = try? container.decode(Double.self, forKey: .height)
        skinColor = try? container.decode(String.self, forKey: .skinColor)
        eyeColor = try? container.decode(String.self, forKey: .eyeColor)
    }
    
    func createObject() -> CharacterObject{
        
        let nameLabel = name
        let homeworld = self.homeworld ?? ""
        let imageLink = image
        let height = self.height ?? 0
        let gender = self.gender
        let eyeColor = self.eyeColor ?? ""
        let skinColor = self.skinColor ?? ""
        
        return CharacterObject(name: nameLabel, homeworld: homeworld, image: imageLink, height: height
            , gender: gender, eyeColor: eyeColor, skinColor: skinColor)
        
    }
    
}
