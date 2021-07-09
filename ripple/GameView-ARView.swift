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
   
   }
   
   @MainActor @objc required dynamic init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }

   @MainActor @objc override required dynamic init(frame frameRect: CGRect) {
      fatalError("init(frame:) has not been implemented")
   }
   
   func addGameController() {
      
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.GCControllerDidConnect, object: nil, queue: nil) { (note) in
         
         guard let _controller = note.object! as? GCController else { return }
         
      
         print ("notification center GCcontroller did connect")
         print(note.object.debugDescription)
         
      }
      
      NotificationCenter.default.addObserver(forName: NSNotification.Name.GCControllerDidDisconnect, object: nil, queue: nil) { (note) in
         print("notification center GCController did disconnect")
         print(note.object.debugDescription)
      }
      //
      let virtualConfiguration = GCVirtualControllerConfiguration()
      
      virtualConfiguration.elements = [GCInputLeftThumbstick, GCInputRightThumbstick, GCInputButtonA, GCInputButtonB]
      
      virtualController = GCVirtualController(configuration: virtualConfiguration)
      
      virtualController?.connect { error in
         if error == nil { print("error nill")}
       //error?.localizedDescription
      }
      
      
      
   }
   
   
   func configureWorldTracking() {
      let configuration = ARWorldTrackingConfiguration()
      configuration.planeDetection = .vertical
      session.run(configuration, options: .resetTracking)
   }
   
   func setDebugSettings() {
      debugOptions = [.showFeaturePoints, .showWorldOrigin, .showSceneUnderstanding, .showPhysics, .showStatistics, .showAnchorOrigins, .showAnchorGeometry]
   }
   
}
