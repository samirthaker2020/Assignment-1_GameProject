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
    private var spinnyNode : SKShapeNode?
    let player = SKSpriteNode(imageNamed: "player")
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
           // adding player position
           player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
           // add player on scene
           addChild(player)
        
        
      physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self as? SKPhysicsContactDelegate
         
         run(SKAction.repeatForever(
           SKAction.sequence([
             SKAction.run(addMonster),
             SKAction.wait(forDuration: 1.0)
             ])
         ))
         
         let backgroundMusic = SKAudioNode(fileNamed: "background-music-aac.caf")
         backgroundMusic.autoplayLooped = true
         addChild(backgroundMusic)
        }
    func random() -> CGFloat {
      return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
      return random() * (max - min) + min
    }
    
    func addMonster() {
      // Create sprite
      let monster = SKSpriteNode(imageNamed: "monster")
      
      monster.physicsBody = SKPhysicsBody(rectangleOf: monster.size) // 1
      monster.physicsBody?.isDynamic = true // 2
      monster.physicsBody?.categoryBitMask = PhysicsCategory.monster // 3
      monster.physicsBody?.contactTestBitMask = PhysicsCategory.projectile // 4
      monster.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
      
      // Determine where to spawn the monster along the Y axis
      let actualY = random(min: monster.size.height/2, max: size.height - monster.size.height/2)
      
      // Position the monster slightly off-screen along the right edge,
      // and along a random position along the Y axis as calculated above
      monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
      
      // Add the monster to the scene
      addChild(monster)
      
      // Determine speed of the monster
      let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
      
      // Create the actions
      let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y: actualY), duration: TimeInterval(actualDuration))
      let actionMoveDone = SKAction.removeFromParent()
      let loseAction = SKAction.run() { [weak self] in
        guard let `self` = self else { return }
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
       // let gameOverScene = GameOverScene(size: self.size, won: false)
       // self.view?.presentScene(gameOverScene, transition: reveal)
      }
      monster.run(SKAction.sequence([actionMove, loseAction, actionMoveDone]))
    }
    }
    
   
    

