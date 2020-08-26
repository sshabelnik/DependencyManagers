//
//  ViewController.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 24.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit
import PresenterKit

class ViewController: UIViewController {
    
    private let networkManager = NetworkManager()
    
    private var items: [CharacterObject] = []
    
    private let cellIdentifier = "MainTableViewCell"
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getCharacters()
    }
}

// MARK: - TableView

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MainTableViewCell
        
        cell.setup(for: items[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedItem = items[indexPath.row]
        let vc = DetailViewController()
        vc.setup(for: selectedItem)
        presentController(vc, type: .showDetail(.withNavigation), animated: true)
    }
}

// MARK: - NetworkManager

extension ViewController{
    
    func getCharacters(){
        networkManager.fetchCharacters { [weak self] (response) in
            
            DispatchQueue.main.async {
        
                switch response{
                case .success(let characters):
                    self?.items = characters
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
    }
}


