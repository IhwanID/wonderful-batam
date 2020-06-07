//
//  ProfileViewController.swift
//  wonderfulbatam
//
//  Created by Ihwan ID on 06/06/20.
//  Copyright © 2020 Ihwan ID. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photo.asCircle()
        // Do any additional setup after loading the view.
    }


  
}
extension UIImageView{

      func asCircle(){
          self.layer.cornerRadius = self.frame.width / 2;
          self.layer.masksToBounds = true
      }

  }
