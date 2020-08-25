//
//  MainTableViewCell.swift
//  DependencyManagers
//
//  Created by Сергей Шабельник on 25.08.2020.
//  Copyright © 2020 Сергей Шабельник. All rights reserved.
//

import UIKit
import SDWebImage

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var selfieImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(for character: CharacterObject){
        nameLabel.text = character.name
        homeworldLabel.text = character.homeworld
        selfieImageView.sd_setImage(with: URL(string: character.image), placeholderImage: UIImage(named: "\(character.name).jpg"))
    }
    
    

}
