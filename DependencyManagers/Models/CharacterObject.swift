//
//  CharacterObject.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 25.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

struct CharacterObject{
    
    internal let name: String
    internal let homeworld: String
    internal let image: String
    internal let height: Double
    internal let gender: String
    internal let eyeColor: String
    internal let skinColor: String
    
}

extension CharacterObject: Displayable{
    
    var titleLabelText: String {
        return name
    }
    var subtitleLabelText: String {
        return "HOMEWORLD: \(homeworld)"
    }
    var imageURL: URL {
        return URL(string: image)!
    }
    var heightLabelText: String {
        return String("HEIGHT: \(height) m.")
    }
    var genderLabelText: String {
        return "GENDER: \(gender)"
    }
    var eyeColorLabelText: String {
        return "EYECOLOR: \(eyeColor)"
    }
    var skinColorLabelText: String {
        return "SKINCOLOR: \(skinColor)"
    }
}
