//
//  Song.swift
//  moodmatch
//
//  Created by Aditya Kishan Ankaraboyana on 7/14/19.
//  Copyright © 2019 Aditya Kishan Ankaraboyana. All rights reserved.
//

import Foundation
import UIKit

class Song {
    
    //MARK: Properties
    
    var name: String
    var image: UIImage?
    
    //MARK: Initialization
    
    init?(name: String, image: UIImage?) {
        
        guard !name.isEmpty else{
            return nil
        }
        
        self.name = name
        self.image = image
        
    }
}
