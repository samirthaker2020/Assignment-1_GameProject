//
//  StartGameViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-13.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    var c=UserDefaults.standard;
   
    var labelTexts = ["Player Name", "Game Level"]
 var pickerData: [String] = [String]()
    var level: [String] = [String]()
    @IBOutlet weak var playerselection: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerselection.delegate = self as! UIPickerViewDelegate
        self.playerselection.dataSource = self as! UIPickerViewDataSource
        pickerData=["Player-A","Player-B"]
        level = ["Easy","Hard"]
        
              c.set("none", forKey: "currentplayer")
               c.set("Easy", forKey: "level")
        
        
        let labelWidth = playerselection.frame.width / CGFloat(playerselection.numberOfComponents)
               for index in 0..<labelTexts.count {
                   let label: UILabel = UILabel.init(frame: CGRect(x: playerselection.frame.origin.x + labelWidth * CGFloat(index), y: 0, width: labelWidth, height: 20))
                      label.text = labelTexts[index]
                      label.textAlignment = .center
                      playerselection.addSubview(label)
                  }
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
              super.didReceiveMemoryWarning()
              // Dispose of any resources that can be recreated.
          }
     
   
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 2
       }
       
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
               return pickerData.count
              }
              else{
            return level.count
              }
         
       }
    func  pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
        return pickerData[row]
        }
        else{
             return level[row]
        }
       
    }
    
    
    @IBAction func Startgame(_ sender: UIButton) {
        print("Go to start game")
                       let sb = UIStoryboard(name: "Main", bundle: nil)
                                      let studentDetailsVC = sb.instantiateViewController(withIdentifier: "to_game") as!  GameViewController
                                      
                                  self.navigationController?.pushViewController(studentDetailsVC, animated: true)
    }
    
       // Number of columns of data
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        c.set(pickerData[playerselection.selectedRow(inComponent: 0)], forKey: "currentplayer")
        print( c.string(forKey: "currentplayer")!)
        
        c.set(pickerData[playerselection.selectedRow(inComponent: 1)], forKey: "level")
               print( c.string(forKey: "level")!)
    //   print( level[playerselection.selectedRow(inComponent: 1)])
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
