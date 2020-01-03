//
//  ViewController.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 12/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var games = [GameRAWG]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
    }


}
extension CatalogViewController: UISearchBarDelegate {
    
}

extension CatalogViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        return cell
    }
    
    
}

