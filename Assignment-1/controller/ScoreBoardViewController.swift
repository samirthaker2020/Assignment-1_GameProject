//
//  ScoreBoardViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-12.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    var data = [Mydata]()
    @IBOutlet weak var tblscoreboard: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellplayer") as! ScoreBoardTableViewCell
               let stud = self.data[indexPath.row]
             
               cell.pname.text = "Player: : \(stud.pname)"
               cell.pscore.text = "Score : \(stud.pscore)"
        
        return cell
                
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 self.tblscoreboard.delegate = self
 self.tblscoreboard.dataSource = self
        readInfoPlistFile()
        // Do any additional setup after loading the view.
    }
    
    func readInfoPlistFile()
       {
           if let plist = Bundle.main.path(forResource: "playerinfo", ofType: "plist")
           {
               if let dict = NSDictionary(contentsOfFile: plist)
               {
                   if let players = dict["Player"] as? [[String:Any]]
                   {
                       for ply in players
                       {
                           let pscore = ply["score"] as! Int
                           let pname = ply["name"] as! String
                           
                           
                           self.data.append(Mydata(pname: pname, pscore: pscore))
                           
                           self.tblscoreboard.reloadData()
                       }
                   }
               }
           }
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
