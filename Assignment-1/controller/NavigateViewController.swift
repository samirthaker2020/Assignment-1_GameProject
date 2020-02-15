//
//  NavigateViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-15.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit
import SpriteKit
class NavigateViewController: UIViewController {
     
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       gotomenu()
        
        // Do any additional setup after loading the view.
    }
    func gotomenu(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
                   let studentDetailsVC = sb.instantiateViewController(withIdentifier: "to_mainpage") as!   MenuTableViewController
                   
               self.navigationController?.pushViewController(studentDetailsVC, animated: true)
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
