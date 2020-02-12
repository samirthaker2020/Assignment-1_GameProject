//
//  MenuTableViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-12.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//
import UIKit
import SpriteKit
 

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
   self.navigationItem.setHidesBackButton(true, animated: false)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0
        {
            switch indexPath.row {
            case 0:
                print("Go to game")
               
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let studentDetailsVC = sb.instantiateViewController(withIdentifier: "to_game") as!  GameViewController
                
            self.navigationController?.pushViewController(studentDetailsVC, animated: true)
            case 1:
                print("Go to score board")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                                              let studentDetailsVC = sb.instantiateViewController(withIdentifier: "to_scoreboard") as!  ScoreBoardViewController
                                              
                                          self.navigationController?.pushViewController(studentDetailsVC, animated: true)
                
            case 2:
                print("Go to player")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                               let studentDetailsVC = sb.instantiateViewController(withIdentifier: "to_addplayer") as!  AddPlayersViewController
                               
                           self.navigationController?.pushViewController(studentDetailsVC, animated: true)
                
            default:
                print("Invalid Option")
            }
        }else{
            switch indexPath.row {
            case 0:
                print("Go to Help Page")
            case 1:
                print("Go to logout")
                showMessageResetApp()
           
            default:
                print("Invalid Option")
            }
        }
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
                           exit(-1)
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

}
