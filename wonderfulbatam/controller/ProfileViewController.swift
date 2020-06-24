//
//  ProfileViewController.swift
//  wonderfulbatam
//
//  Created by Ihwan ID on 06/06/20.
//  Copyright © 2020 Ihwan ID. All rights reserved.
//

import UIKit
import SafariServices

private let reuseIdentifier = "SettingsCell"


class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
    }
  
}



extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let section = SettingsSection(rawValue: section) else { return 0 }
        
        switch section {
        case .Social: return SocialOptions.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .white
        title.text = SettingsSection(rawValue: section)?.description
        view.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        title.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        guard let section = SettingsSection(rawValue: indexPath.section) else { return UITableViewCell() }

        switch section {
        case .Social:
            let social = SocialOptions(rawValue: indexPath.row)
            cell.sectionType = social
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = SettingsSection(rawValue: indexPath.section) else { return }
        
        switch section {
        case .Social:
            var url = ""
            
            if(SocialOptions(rawValue: indexPath.row)?.description == "Facebook"){
                url = "https:facebook.com/ihwan.id"
            }else if(SocialOptions(rawValue: indexPath.row)?.description == "Instagram"){
                url = "https://instagram.com/ihwan.id"
            }else if(SocialOptions(rawValue: indexPath.row)?.description == "Twitter"){
                url = "https://twitter.com/ihwan_id"
            }else{
                url = "https://linkedin.com/in/ihwanid"
            }
            let vc = SFSafariViewController(url: URL(string: url)!)
            present(vc, animated: true)
            
        }
    }
}


extension UIImageView{

      func asCircle(){
          self.layer.cornerRadius = self.frame.width / 2;
          self.layer.masksToBounds = true
      }

  }
