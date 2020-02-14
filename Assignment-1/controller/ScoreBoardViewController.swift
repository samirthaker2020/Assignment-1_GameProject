//
//  ScoreBoardViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-12.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController  {
     
    var c=UserDefaults.standard
    @IBOutlet weak var playerA: UILabel!
    
    @IBOutlet weak var playerB: UILabel!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let a = c.string(forKey: "PlayerA")!
        let b = c.string(forKey: "PlayerB")!
        // Do any additional setup after loading the view.
       
        playerB.text="A::"+b
        playerA.text="B::"+a
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
