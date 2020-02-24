//
//  DetailViewController.swift
//  itunesTest
//
//  Created by Rodrigo Astorga on 23-02-20.
//  Copyright © 2020 Rodrigo Astorga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
    }

}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellImage = tableView.dequeueReusableCell(withIdentifier: "cellImage", for: indexPath)
        let cellAlbum = tableView.dequeueReusableCell(withIdentifier: "cellAlbum", for: indexPath)
        let cellBand = tableView.dequeueReusableCell(withIdentifier: "cellBand", for: indexPath)
        let cellNameSong = tableView.dequeueReusableCell(withIdentifier: "cellNameSong", for: indexPath)
        
        if indexPath.row == 0 {
            return cellImage
        } else if indexPath.row == 1 {
            return cellAlbum
        } else if indexPath.row == 2 {
            return cellBand
        } else {
            return cellNameSong
        }
    }
}
