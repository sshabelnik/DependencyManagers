//
//  ViewController.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 24.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit
import Alamofire
import PresenterKit

class ViewController: UIViewController {
    
    var items: [CharacterObject] = []
    var selectedItem: CharacterObject!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCharacters()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //NetworkManager.shared.fetchCharacters()
    }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        
        cell.setup(for: items[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = items[indexPath.row]
        
        let cell = tableView.cellForRow(at: indexPath)!.contentView
        let config = PopoverConfig(source: .view(container: cell, frame: nil), delegate: self)
        let vc = DetailViewController()
        vc.selectedItem = self.selectedItem
        presentController(vc, type: .popover(config), animated: true)
    }
}

// MARK: - Alamofire

extension ViewController{
    
    func fetchCharacters(){
        
        AF.request("https://akabab.github.io/starwars-api/api/all.json")
        .validate()
            .responseDecodable(of: [Character].self) { (response) in
            guard let characters = response.value else { return }
                DispatchQueue.main.async {
                    let charactersArray = characters.map({$0.createObject()})
                    self.items = charactersArray
                    self.tableView.reloadData()
                }
                
                
        }
    }
}

// MARK: UIPopoverPresentationControllerDelegate

extension ViewController: UIPopoverPresentationControllerDelegate{
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}


