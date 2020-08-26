//
//  Displayable.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 26.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation

protocol Displayable {
    var titleLabelText: String { get }
    var subtitleLabelText: String { get }
    var imageURL: URL { get }
    var heightLabelText: String { get }
    var genderLabelText: String { get }
    var eyeColorLabelText: String { get }
    var skinColorLabelText: String { get } 
}
