//
//  MRTTableViewCell.swift
//  MRT
//
//  Created by Roy on 2016/5/5.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit

class MRTTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var stationName: UILabel!
    
    @IBOutlet weak var Line_1: UILabel!
    
    @IBOutlet weak var Line_2: UILabel!
    
    @IBOutlet weak var Line2_back: UIView!
    
   
    @IBOutlet weak var Line1_back: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
