//
//  GameVC.swift
//  ripple
//
//  Created by Lawrence Herman on 7/6/21.
//

import Foundation
import RealityKit
import ARKit
import GameController

//let session = myView.session

class GameView : ARView {
   
   var virtualController: GCVirtualController?
   
   override init(frame frameRect: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool) {
      super.init(frame: frameRect, cameraMode: cameraMode, automaticallyConfigureSession: automaticallyConfigureSession)
  
     
    
      
//      print(virtualController?.controller.debugDescription)
//    
//      virtualController?.controller?.extendedGamepad?.valueChangedHandler
   }

   func configureWorldTracking() {
      let configuration = ARWorldTrackingConfiguration()
      configuration.planeDetection = .vertical
      session.run(configuration, options: .resetTracking)
   }
   
   func setDebugSettings() {
      debugOptions = [.showFeaturePoints, .showWorldOrigin, .showSceneUnderstanding, .showPhysics, .showAnchorOrigins, .showAnchorGeometry]
   }
   
   
   @MainActor @objc required dynamic init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   @MainActor @objc required dynamic init(frame frameRect: CGRect) {
      fatalError("init(frame:) has not been implemented")
   }
}
