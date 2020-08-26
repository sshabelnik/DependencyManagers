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
        
        selfieImageView.layer.cornerRadius = selfieImageView.frame.height / 2
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(for character: Displayable){
        nameLabel.text = character.titleLabelText
        homeworldLabel.text = character.subtitleLabelText
        selfieImageView.sd_setImage(with: character.imageURL, placeholderImage: UIImage(named: "\(character.titleLabelText)"))
    }
}
