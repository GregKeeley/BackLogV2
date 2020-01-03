//
//  AddGameViewController.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 1/3/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchResults = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
    }

}
extension AddGameViewController: UISearchBarDelegate {
    
}
extension AddGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameSearchCell", for: indexPath)
        return cell
    }
    
    
}
