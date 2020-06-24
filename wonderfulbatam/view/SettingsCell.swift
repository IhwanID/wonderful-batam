//
//  SettingsCell.swift
//  wonderfulbatam
//
//  Created by Ihwan ID on 24/06/20.
//  Copyright © 2020 Ihwan ID. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    var sectionType: SectionType? {
        didSet {
            guard let sectionType = sectionType else { return }
            textLabel?.text = sectionType.description
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
