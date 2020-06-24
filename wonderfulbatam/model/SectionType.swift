//
//  SectionType.swift
//  wonderfulbatam
//
//  Created by Ihwan ID on 24/06/20.
//  Copyright © 2020 Ihwan ID. All rights reserved.
//

protocol SectionType: CustomStringConvertible {
}

enum SettingsSection: Int, CaseIterable, CustomStringConvertible {
    case Social
    
    var description: String {
        switch self {
        case .Social: return "Social Media"
        }
    }
}

enum SocialOptions: Int, CaseIterable, SectionType {
    case facebook
    case instagram
    case linkedin
    case twitter
    
    var containsSwitch: Bool { return false }
    
    var description: String {
        switch self {
        case .facebook: return "Facebook"
        case .instagram: return "Instagram"
        case .linkedin: return "LinkedIn"
        case .twitter: return "Twitter"
        }
    }
}
