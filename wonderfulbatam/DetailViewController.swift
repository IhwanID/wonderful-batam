//
//  DetailViewController.swift
//  wonderfulbatam
//
//  Created by Ihwan ID on 30/04/20.
//  Copyright © 2020 Ihwan ID. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()

         if let result = place {
                   photo.image = result.photo
                   name.text = result.name
                   desc.text = result.description
               }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
