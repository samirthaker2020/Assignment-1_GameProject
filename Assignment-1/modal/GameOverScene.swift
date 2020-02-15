 
 /// Copyright (c) 2018 Razeware LLC
 ///
 /// Permission is hereby granted, free of charge, to any person obtaining a copy
 /// of this software and associated documentation files (the "Software"), to deal
 /// in the Software without restriction, including without limitation the rights
 /// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 /// copies of the Software, and to permit persons to whom the Software is
 /// furnished to do so, subject to the following conditions:
 ///
 /// The above copyright notice and this permission notice shall be included in
 /// all copies or substantial portions of the Software.
 ///
 /// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 /// distribute, sublicense, create a derivative work, and/or sell copies of the
 /// Software in any work that is designed, intended, or marketed for pedagogical or
 /// instructional purposes related to programming, coding, application development,
 /// or information technology.  Permission for such use, copying, modification,
 /// merger, publication, distribution, sublicensing, creation of derivative works,
 /// or sale is expressly withheld.
 ///
 /// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 /// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 /// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 /// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 /// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 /// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 /// THE SOFTWARE.
 
 import UIKit
 import Foundation
 import SpriteKit

 class GameOverScene: SKScene {
    var viewController: UIViewController?
    init(size: CGSize, won:Bool,p:Int) {
     super.init(size: size)

     backgroundColor = SKColor.white
       
     // 2
     let message = won ? "You Won!" : "You Lose :["
     
     // 3
     let label = SKLabelNode(fontNamed: "Chalkduster")
     label.text = message
     label.fontSize = 40
     label.fontColor = SKColor.black
     label.position = CGPoint(x: size.width/2, y: size.height/2)
     addChild(label)
        let label1 = SKLabelNode(fontNamed: "Chalkduster")
            label1.text="Your Score ::"+" "+String(p)
            label1.fontSize = 20
            label1.fontColor = SKColor.black
            label1.position = CGPoint(x: size.width/2, y: size.height/3)
            addChild(label1)
     
     // 4
        
        let seconds = 4.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let appDelegate = UIApplication.shared.delegate as! AppDelegate
                        let homeVC = storyboard.instantiateViewController(withIdentifier: "to_mainpage") as! MenuTableViewController
                        //Below's navigationController is useful if u want NavigationController in the destination View
                        let navigationController = UINavigationController(rootViewController: homeVC)
                        appDelegate.window!.rootViewController = navigationController
        }
       
     
 /*    func changeScene(){
         let secondScene = GameScene(size: self.size)
         secondScene.scaleMode = scaleMode
         secondScene.object = somethingInFirstSceneThatNeedToBePassed //here we do the passing
         let transition = SKTransition.fadeWithDuration(0.5)
         self.view?.presentScene(secondScene, transition: transition)
     }
 
   
 
  }*/
 }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
 }
 }
