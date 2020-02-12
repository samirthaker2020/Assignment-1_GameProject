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
    
    @IBAction func exit(_ sender: Any) {
       
         showMessageResetApp()
           
    }
    @IBAction func scoreboard(_ sender: UIButton) {
    }
    @IBAction func startgame(_ sender: UIButton) {
        
       let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let controller = storyboard.instantiateViewController(withIdentifier: "to_game") as! GameViewController
              controller.modalPresentationStyle = .fullScreen
             self.present(controller, animated: true, completion: nil)
    }
    func showMessageResetApp(){
            let exitAppAlert = UIAlertController(title: "Quit Game",
                                                 message: "Do you want to Exit ?",
                                                 preferredStyle: .alert)
            
            let resetApp = UIAlertAction(title: "Quit Now", style: .destructive) {
                (alert) -> Void in
                    // home button pressed programmatically - to thorw app to background
                    UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
                    // terminaing app in background
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                        self.exit(EXIT_SUCCESS)
                    })
            }
            
            let laterAction = UIAlertAction(title: "Later", style: .cancel) {
                (alert) -> Void in
                self.dismiss(animated: true, completion: nil)
            }
            
            exitAppAlert.addAction(resetApp)
            exitAppAlert.addAction(laterAction)
            present(exitAppAlert, animated: true, completion: nil)
        
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
