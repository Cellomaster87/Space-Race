//
//  GameScene.swift
//  Space Race
//
//  Created by Michele Galvagno on 12/04/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    // MARK: - Properties
    var starfield: SKEmitterNode!
    var player: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    // MARK: - Movement management
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        starfield = SKEmitterNode(fileNamed: "starfield")!
        starfield.position = CGPoint(x: 1024, y: 384) // stars will flow from the right to the left
        starfield.advanceSimulationTime(10)
        addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 100, y: 384)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size)
        player.physicsBody?.contactTestBitMask = 1 // other things in our game cause intersection notifications with our object
        addChild(player)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        score = 0 // wasn't this already set at the beginning?
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self // tell us when contacts happen!
    }
    
    // MARK: - SpriteKit delegate methods
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
