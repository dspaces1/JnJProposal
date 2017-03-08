//
//  ProfileBuilder.swift
//  Proposal
//
//  Created by Diego Urquiza on 3/5/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import UIKit

struct ProfileBuilder {
    
    func getAll() -> [Profile] {
        var profiles: [Profile] = []
        
        let will = ProfileDetails.will
        let willProfile = Profile(name: will.name, videoURL: will.videoURL, image: will.image)
        profiles.append(willProfile)
        
        let maddie = ProfileDetails.maddie
        let maddieProfile = Profile(name: maddie.name, videoURL: maddie.videoURL, image: maddie.image)
        profiles.append(maddieProfile)
        
        let kopi = ProfileDetails.kopi
        let kopiProfile = Profile(name: kopi.name, videoURL: kopi.videoURL, image: kopi.image)
        profiles.append(kopiProfile)
        
        let chris = ProfileDetails.chris
        let chrisProfile = Profile(name: chris.name, videoURL: chris.videoURL, image: chris.image)
        profiles.append(chrisProfile)
        
        let joe = ProfileDetails.joe
        let joeProfile = Profile(name: joe.name, videoURL: joe.videoURL, image: joe.image)
        profiles.append(joeProfile)
        
        let clip = ProfileDetails.clip
        let clipProfile = Profile(name: clip.name, videoURL: clip.videoURL, image: clip.image)
        profiles.append(clipProfile)
        
        return profiles
    }
}

enum ProfileDetails {
    case will
    case kopi
    case maddie
    case chris
    case joe
    case clip
    
    var name: String {
        switch self {
        case .will: return "Will Kane"
        case .kopi: return "Kopi Ramsay"
        case .maddie: return "Maddie Lu"
        case .chris: return "Chris Corrado"
        case .joe: return "Joe Manfredonia"
        case .clip: return ""
        }
    }
    
    var videoURL: URL {
        switch self {
        case .will:
            let path = Bundle.main.path(forResource: "Will", ofType: "mp4")!
            return URL(fileURLWithPath: path)
        case .kopi:
            let path = Bundle.main.path(forResource: "Kopi", ofType: "mp4")!
            return URL(fileURLWithPath: path)
        case .maddie:
            let path = Bundle.main.path(forResource: "Maddie", ofType: "mp4")!
            return URL(fileURLWithPath: path)
        case .chris:
            let path = Bundle.main.path(forResource: "Chris", ofType: "mp4")!
            return URL(fileURLWithPath: path)
        case .joe:
            let path = Bundle.main.path(forResource: "Joe", ofType: "mp4")!
            return URL(fileURLWithPath: path)
        case .clip:
            let path = Bundle.main.path(forResource: "Clip", ofType: "mp4")!
            return URL(fileURLWithPath: path)
        }
    }
    
    var image: UIImage {
        switch self {
        case .will: return UIImage(named: "Will")!
        case .kopi: return UIImage(named: "Kopi")!
        case .maddie: return UIImage(named: "Maddie")!
        case .chris: return UIImage(named: "Chris")!
        case .joe: return UIImage(named: "Joe")!
        case .clip: return UIImage(named: "Credo")!
        }
    }
}
