//
//  GameScene.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-07.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    let player = SKSpriteNode(imageNamed: "player")
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
           // adding player position
           player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
           // add player on scene
           addChild(player)
        
        
      
        }
    }
    
   
    

