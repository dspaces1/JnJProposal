//
//  ClassName+NSObject.swift
//  Proposal
//
//  Created by Diego Urquiza on 2/28/17.
//  Copyright © 2017 Diego Urquiza. All rights reserved.
//

import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
