//
//  TrackNameTableViewCell.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

class TrackNameTableViewCell: UITableViewCell {

    @IBOutlet weak var trackNameLabel: UILabel!
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            trackNameLabel.text = viewModel.trackName
        }
    }
}

extension TrackNameTableViewCell {
    struct ViewModel {
        let trackName: String
    }
}
