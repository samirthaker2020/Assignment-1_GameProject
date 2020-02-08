//
//  GameViewController.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-07.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
           let scene = GameScene(size: view.bounds.size)
           let skView = view as! SKView
           skView.showsFPS = true
           skView.showsNodeCount = true
           skView.ignoresSiblingOrder = true
           scene.scaleMode = .resizeFill
           skView.presentScene(scene)
    }
             
}
