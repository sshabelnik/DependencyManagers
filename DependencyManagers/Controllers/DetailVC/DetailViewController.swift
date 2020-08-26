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
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var eyecolorLabel: UILabel!
    @IBOutlet weak var skincolorLabel: UILabel!
    
    private var character: Displayable!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            configureCell()
    }
    
    // MARK: - Set Character
    func setup(for character: CharacterObject){
        self.character = character
    }
    
    // MARK: - UI
    func configureCell(){
        imageView.sd_setImage(with: character.imageURL, placeholderImage: UIImage(named: "\(character.titleLabelText)"))
           nameLabel.text = character.titleLabelText
           homeworldLabel.text = character.subtitleLabelText
        heightLabel.text = character.heightLabelText
        genderLabel.text = character.genderLabelText
        eyecolorLabel.text = character.eyeColorLabelText
        skincolorLabel.text = character.skinColorLabelText
        
        imageView.layer.cornerRadius = 30
    }
}
