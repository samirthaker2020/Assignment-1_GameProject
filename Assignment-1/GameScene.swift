//
//  GameScene.swift
//  Assignment-1
//
//  Created by SAMIR THAKER on 2020-02-07.
//  Copyright © 2020 SAMIR THAKER. All rights reserved.
//

import SpriteKit
import GameplayKit
func +(left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
func sqrt(a: CGFloat) -> CGFloat {
  return CGFloat(sqrtf(Float(a)))
}
#endif

extension CGPoint {
  func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
  
  func normalized() -> CGPoint {
    return self / length()
  }
}
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
        physicsWorld.gravity = .zero
       // physicsWorld.contactDelegate = self as? SKPhysicsContactDelegate
           
           run(SKAction.repeatForever(
             SKAction.sequence([
               SKAction.run(addMonster),
               SKAction.wait(forDuration: 1.0)
               ])
           ))
           
           let backgroundMusic = SKAudioNode(fileNamed: "background.mp3")
           backgroundMusic.autoplayLooped = true
           addChild(backgroundMusic)
        
}
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           if let touch = touches.first {
               let currentLocation = touch.location(in: self)
               let previousLocation = touch.previousLocation(in: self)
               
               deltaPoint = CGPoint(x: currentLocation.x - previousLocation.x, y: currentLocation.y - previousLocation.y)
           }
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
    
    
    ////////////////////////
    
    
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
      
      let actualx = random(min: monster.size.width * 3.0, max: size.width)
          
         // Position the monster slightly off-screen along the right edge,
         // and along a random position along the Y axis as calculated above
         monster.position = CGPoint(x : actualx , y: size.height )
          
         // Add the monster to the scene
         addChild(monster)
          
         // Determine speed of the monster
         let actualDuration = random(min: CGFloat(2.0), max: CGFloat(8.0))
          
         // Create the actions
         let actionMove = SKAction.move(to: CGPoint(x: actualx, y: -monster.size.height * 8.0 ),
                 duration: TimeInterval(actualDuration))
         let actionMoveDone = SKAction.removeFromParent()
         monster.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
          deltaPoint = CGPoint(x: 0, y: 0)
      // 1 - Choose one of the touches to work with
      guard let touch = touches.first else {
        return
      }
      run(SKAction.playSoundFileNamed("arrow.mp3", waitForCompletion: false))
      
      let touchLocation = touch.location(in: self)
      
      // 2 - Set up initial location of projectile
      let projectile = SKSpriteNode(imageNamed: "knife")
      projectile.position = player.position
      
      projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
      projectile.physicsBody?.isDynamic = true
      projectile.physicsBody?.categoryBitMask = PhysicsCategory.projectile
      projectile.physicsBody?.contactTestBitMask = PhysicsCategory.monster
      projectile.physicsBody?.collisionBitMask = PhysicsCategory.none
      projectile.physicsBody?.usesPreciseCollisionDetection = true
      
      // 3 - Determine offset of location to projectile
      let offset = touchLocation - projectile.position
      
      // 4 - Bail out if you are shooting down or backwards
      if offset.x < 0 { return }
      
      // 5 - OK to add now - you've double checked position
      addChild(projectile)
      
      // 6 - Get the direction of where to shoot
      let direction = offset.normalized()
      
      // 7 - Make it shoot far enough to be guaranteed off screen
      let shootAmount = direction * 1000
      
      // 8 - Add the shoot amount to the current position
      let realDest = shootAmount + projectile.position
      
      // 9 - Create the actions
      let actionMove = SKAction.move(to: realDest, duration: 2.0)
      let actionMoveDone = SKAction.removeFromParent()
      projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
}
    

