//
//  ViewController.swift
//  Majestic
//
//  Created by andyhaz on 8/9/23.
//

import Cocoa
import SceneKit
import Quartz

class ViewController: NSViewController {

    @IBOutlet weak var myThreeView: SCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneSetup()
        // Do any additional setup after loading the view.
    }

    // MARK: Scene
    func sceneSetup() {
      // 1
      let scene = SCNScene()
        
      // 2
      let boxGeometry = SCNBox(width: 10.0, height: 10.0, length: 10.0, chamferRadius: 1.0)
      let boxNode = SCNNode(geometry: boxGeometry)
      scene.rootNode.addChildNode(boxNode)
      // 3
      myThreeView.scene = scene
      myThreeView.autoenablesDefaultLighting = true
      myThreeView.allowsCameraControl = true
    //
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLight.LightType.ambient
        ambientLightNode.light!.color = NSColor(deviceWhite: 0.67, alpha: 1.0)
        scene.rootNode.addChildNode(ambientLightNode)
    //
        let omniLightNode = SCNNode()
        omniLightNode.light = SCNLight()
        omniLightNode.light!.type = SCNLight.LightType.omni
        omniLightNode.light!.color = NSColor(white: 0.75, alpha: 1.0)
        omniLightNode.position = SCNVector3Make(0, 50, 50)
        scene.rootNode.addChildNode(omniLightNode)
    //cam
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0, 0, 25)
        scene.rootNode.addChildNode(cameraNode)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

