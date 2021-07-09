//
//  Extensions.swift
//  ripple
//
//  Created by Lawrence Herman on 7/6/21.
//

import Foundation
import ARKit
import RealityKit


extension GameView: ARCoachingOverlayViewDelegate {
   
   func addCoaching() {
      //Create a ARCoachingOverlayView object
      let coachingOverlay = ARCoachingOverlayView()
      coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      
      self.addSubview(coachingOverlay)
      
      coachingOverlay.goal = .verticalPlane
      coachingOverlay.session = self.session
      coachingOverlay.delegate = self
   }
   
   
   func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
      print("coachingOverlayWillActivate")
   }
   
   func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
      print("coachingOverlayDidActivate")
   }

   
}
