//
//  ViewController.swift
//  wonderfulbatam
//
//  Created by Ihwan ID on 30/04/20.
//  Copyright © 2020 Ihwan ID. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Wonderful Batam"
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaceCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetail") {
            guard let object = sender as? Place else { return }
            let vc = segue.destination as! DetailViewController
            vc.place = object
        }
    }
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: places[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath) as! PlaceTableViewCell
        
        let place = places[indexPath.row]
        cell.name.text = place.name
        
        cell.photo.image = place.photo
        
        return cell
    }
    
    
}
