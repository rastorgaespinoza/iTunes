//
//  DetailArtistTableViewCell.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

class DetailArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            trackName.text = viewModel.trackName
            artistName.text = viewModel.artistName
        }
    }
}

extension DetailArtistTableViewCell {
    struct ViewModel {
        let trackName: String
        let artistName: String
    }
}
