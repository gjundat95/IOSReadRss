//
//  HomeTableViewCell.swift
//  QuizShow
//
//  Created by Tinh Ngo on 9/12/16.
//  Copyright © 2016 Tinh Ngo. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var des: UILabel!
    @IBOutlet weak var viewContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.contentView.frame = self.bounds;
//        self.contentView.autoresizingMask = UIViewAutoresizing.flexibleWidth;
        self.viewContent.layer.cornerRadius = 10
        self.viewContent.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
//    override func layoutSubviews() {
//        let f = contentView.frame
//        let fr = UIEdgeInsetsInsetRect(f, UIEdgeInsetsMake(5, 10, 5, 10))
//        contentView.frame = fr
//    }
    
    

}
