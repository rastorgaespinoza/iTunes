//
//  ArtworkTableViewCell.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit
import Kingfisher

class ArtworkTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkImage: UIImageView!

    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            artworkImage.kf.setImage(with: viewModel.artworkURL)
        }
    }
}

extension ArtworkTableViewCell {
    struct ViewModel {
        let artworkURL: URL
    }
}
