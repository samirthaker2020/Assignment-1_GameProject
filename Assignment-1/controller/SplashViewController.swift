//
//  SplashViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-11.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 self.navigationItem.setHidesBackButton(true, animated: false)
        self.automaticallyAdjustsScrollViewInsets = false
           //Do something
            perform(#selector(MovetoMain), with: nil, afterDelay: 2)
        
            }
    
   

     
     @objc func MovetoMain()
     {
     
     
         
             performSegue(withIdentifier: "to_mainpage", sender: self)
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


