//
//  Common.swift
//  ReadRss
//
//  Created by Tinh Ngo on 9/26/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import Foundation
import UIKit

class Common {
    
    static func addAndFillSubviewIntoParentview(subview: UIView, parentview: UIView) {
        parentview.addSubview(subview)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        parentview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subview]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["subview" : subview]))
        
        parentview.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subview]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["subview" : subview]))
        
        parentview.layoutIfNeeded()
    }

}
