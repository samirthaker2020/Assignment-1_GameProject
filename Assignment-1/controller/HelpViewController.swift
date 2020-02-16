//
//  HelpViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-15.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit
import WebKit
class HelpViewController: UIViewController {
 @IBOutlet weak var htmlview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
               guard let filePath = Bundle.main.path(forResource: "help", ofType: "html")
                   else {
                       // File Error
                       print ("File reading error")
                       return
               }

               let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
               let baseUrl = URL(fileURLWithPath: filePath)
               htmlview.loadHTMLString(contents as String, baseURL: baseUrl)
           }
           catch {
               print ("File HTML error")
           }
        // Do any additional setup after loading the view.
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
