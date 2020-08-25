//
//  DetailViewController.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 25.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    
    var selectedItem: CharacterObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(for: selectedItem)
        // Do any additional setup after loading the view.
    }

    func setup(for character: CharacterObject){
        
        imageView.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: "\(character.name)"))
        nameLabel.text = character.name
        homeworldLabel.text = character.homeworld
    }
}
