//
//  ViewController.swift
//  moodmatch
//
//  Created by Aditya Kishan Ankaraboyana on 7/13/19.
//  Copyright © 2019 Aditya Kishan Ankaraboyana. All rights reserved.
//

import UIKit
import Foundation
import os.log

struct Log {
    static var general = OSLog(subsystem: "com.bubbles.moodmatch", category: "general")
}

class PlaylistController: UIViewController {

  
    
    @IBAction func music(_ sender: UIButton) {
          
    }
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 82/255, green: 0/255, blue: 245/255, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    //MARK: Navigation
    override func prepare(for: UIStoryboardSegue, sender: Any?){
//        super.prepare(for: segue, sender: sender)
        
    }
    
    
    //MARK : Actions
//    private func displayCover(content: JSONSerialization) {
//
//    }
}

