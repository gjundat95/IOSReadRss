//
//  MenuLefTableViewCell.swift
//  ReadRss
//
//  Created by Tinh Ngo on 9/26/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import UIKit

class MenuLefTableViewCell: UITableViewCell {

    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
