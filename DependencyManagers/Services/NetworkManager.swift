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
    
    private let url = "https://akabab.github.io/starwars-api/api/all.json"
    
    func fetchCharacters(completion: @escaping (Result<[CharacterObject], Error>) -> Void){
        
        AF.request(url)
        .validate()
            .responseDecodable(of: [Character].self) { (response) in
                
                if let error = response.error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    return
                }
        
            guard let characters = response.value else { return }
                DispatchQueue.main.async {
                    let charactersArray = characters.map({$0.createObject()})
                    completion(.success(charactersArray))
                }
                
                
        }
    }
}
