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
    struct PhysicsCategory {
      static let none      : UInt32 = 0
      static let all       : UInt32 = UInt32.max
      static let monster   : UInt32 = 0b1       // 1
      static let projectile: UInt32 = 0b10      // 2
    }
    private var label : SKLabelNode?
        var deltaPoint = CGPoint(x: 0, y: 0)
    private var spinnyNode : SKShapeNode?
    let player = SKSpriteNode(imageNamed: "player")
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
           // adding player position
           player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
           // add player on scene
           addChild(player)
        
        
}
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           if let touch = touches.first {
               let currentLocation = touch.location(in: self)
               let previousLocation = touch.previousLocation(in: self)
               
               deltaPoint = CGPoint(x: currentLocation.x - previousLocation.x, y: currentLocation.y - previousLocation.y)
           }
       }
       
       override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
           deltaPoint = CGPoint(x: 0, y: 0)
       }
       
       override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
           deltaPoint = CGPoint(x: 0, y: 0)
       }
       
       override func update(_ currentTime: TimeInterval) {
           let xPos = player.position.x + deltaPoint.x
           let yPos = player.position.y + deltaPoint.y
           let newPosition = CGPoint(x: xPos, y: yPos)
          player.position = newPosition
           deltaPoint = CGPoint(x: 0, y:0)
       }
}
    

