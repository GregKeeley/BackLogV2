//
//  ViewController.swift
//  BackLogV2
//
//  Created by Gregory Keeley on 12/27/19.
//  Copyright © 2019 Gregory Keeley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }


}
extension ViewController: UISearchBarDelegate {
    
}
