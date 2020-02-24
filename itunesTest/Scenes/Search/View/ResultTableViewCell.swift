//
//  ResultTableViewCell.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit
import Kingfisher

class ResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            
            artistImage.kf.setImage(with: viewModel.image)

            nameLabel.text = viewModel.name
            trackNameLabel.text = viewModel.trackName
        }
    }
    
}

extension ResultTableViewCell {
    struct ViewModel {
        let name: String
        let trackName: String
        let image: URL
    }
}
