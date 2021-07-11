//
//  GameView-ARSession.swift
//  ripple
//
//  Created by Lawrence Herman on 7/6/21.
//

import Foundation
import ARKit


extension GameView: ARSessionDelegate {
   
   //AR SessionDelegate inherits from ARSessionObserver
   // session delegate
   
   func setupSessionDelegate() {
      session.delegate = self
   }
   
   func session(_ session: ARSession, didUpdate frame: ARFrame) {
//      print(frame.debugDescription)
   }
   
   func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
      print("arsession did add Anchor")
   }
  
   func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
      
   }
   
   func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
      
   }

  

   /////// session observer
   
   func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
      print(camera.transform)
   }
   


func session(_ session: ARSession, didFailWithError error: Error) {
      print("arsession didFail")
   }
   
   func sessionWasInterrupted(_ session: ARSession) {
      print("arsession delegagate sessionWasInterrupted")
   }
   
   func sessionInterruptionEnded(_ session: ARSession) {
      print("arsession delegate sessionInteruptEnded")
   }
   
 

   
}
