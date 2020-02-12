//
//  MainViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-11.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.setHidesBackButton(true, animated: false)
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startgame(_ sender: UIButton) {
        
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let controller = storyboard.instantiateViewController(withIdentifier: "to_game") as! GameViewController
              controller.modalPresentationStyle = .fullScreen
             self.present(controller, animated: true, completion: nil)
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
