//
//  SongTableViewController.swift
//  moodmatch
//
//  Created by Aditya Kishan Ankaraboyana on 7/14/19.
//  Copyright © 2019 Aditya Kishan Ankaraboyana. All rights reserved.
//

import UIKit
import os.log

class SongTableViewController: UITableViewController {

    //MARK: Properties
    
    var songs = [Song]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: " Back", style: .plain, target: self, action: #selector(SongTableViewController.tapBack(sender:)))
        self.navigationItem.title = "Your Playlist"
        self.tableView.backgroundColor = UIColor(red: 47/255, green: 47/255, blue: 47/255, alpha: 1)
        DispatchQueue.main.async {
            self.loadSampleSongs()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @objc func tapBack(sender: UIBarButtonItem){
      //os_log("Clicked the button.", log: OSLog.default, type: .info)        //self.navigationController?.popViewController(animated: true)
       
        dismiss(animated: true, completion: nil)
        
        //navigationController?.dismiss(animated: true, completion: nil)
    }
  
    // MARK: Actions
   
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return songs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellIdentifier = "SongTableViewCell"
        // Configure the cell...
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SongTableViewCell else {
            fatalError("The dequeued cell is not an instance of SongTableViewCell." )
        }
        
        let song = songs[indexPath.row]
        cell.backgroundColor = UIColor(red: 64/255, green: 64/255, blue: 64/255, alpha: 1)
        cell.songName.text = song.name
        cell.songName.textColor = UIColor.white
        cell.songImage.image = song.image

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Private Methods
    
    private func loadSampleSongs() {
        
        
        let url = URL(string: "")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return}
            do {
                let playlistJSON = try JSONSerialization.jsonObject(with: dataResponse, options: []) as? [String: Any]
                let songList = playlistJSON?["data"] as! NSArray
                for i in songList{
                    let item = i as? [String: Any]
                    let coverUrl = URL(string: item?["cover"] as! String)
                    let cover = try? Data(contentsOf: coverUrl!)
                    guard let song = Song(name: item?["title"] as! String, image: UIImage(data: cover!)) else{
                        fatalError("Something is not right here!")
                    }
                    self.songs += [song]
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                //                self.displayCover(content: playlistJSON as! JSONSerialization)
            } catch let parsingError{
                print("Error", parsingError)
            }
        }
        task.resume()
    }
}
