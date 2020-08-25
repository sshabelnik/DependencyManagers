//
//  NetworkManager.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 24.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchCharacters() {
        
        let url = "https://akabab.github.io/starwars-api/api/all.json"
        
        AF.request(url)
            .validate()
            .responseJSON { (data) in
                print(data)
        }
        
    }
}
