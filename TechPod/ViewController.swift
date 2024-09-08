//
//  ViewController.swift
//  TechPod
//
//  Created by 坂下雄哉 on 2024/09/08.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.text = songNameArray[indexPath.row]
        
        content.image = UIImage(named: imageNameArray[indexPath.row])
        
        content.imageProperties.reservedLayoutSize = CGSize(width: 30, height: 30)
        
        cell.contentConfiguration = content
        
        return cell
    }
    

    @IBOutlet var table: UITableView!
    
    var songNameArray = [String]()
    
    var fileNameArray = [String]()
    
    var imageNameArray = [String]()
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        table.delegate = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        
        fileNameArray = ["cannon","elise","aria"]
        
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
    }


}

