//
//  SongTableViewCell.swift
//  moodmatch
//
//  Created by Aditya Kishan Ankaraboyana on 7/14/19.
//  Copyright © 2019 Aditya Kishan Ankaraboyana. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    @IBOutlet weak var songName: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
