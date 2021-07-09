//
//  HostingVC.swift
//  ripple
//
//  Created by Lawrence Herman on 7/5/21.
//

//import Foundation
//import SwiftUI
//import RealityKit
//import ARKit

//class HostingVC: UIHostingController<ContentView> {
//
//   let coachingOverlay = ARCoachingOverlayView()
//
//
//
//   override func viewDidLoad() {
//
//      print("HostingVC viewDidLoad")
//
//
//   }
//
//   override func viewWillAppear(_ animated: Bool) {
//      super.viewWillAppear(animated)
//
//
//
//   }
//
//
//
//
//
//}
//
//
//extension HostingVC: ARSessionDelegate {
//
//   func sessionWasInterrupted(_ session: ARSession) {
//
//
//   }
//
//   func sessionInterruptionEnded(_ session: ARSession) {
//
//   }
//
//   func session(_ session: ARSession, didUpdate frame: ARFrame) {
//      print("HostingVC ARSession delegate didUpdate frame")
//   }
//
//   func session(_ session: ARSession, didFailWithError error: Error) {
//
//   }
//}
//
//extension HostingVC: ARCoachingOverlayViewDelegate {
//
//   //easiest to put this non delegate function here
//   func loadCoachingOverlay(arView: ARView) {
//      print("loading coaching overlay")
//
//      coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
//      arView.addSubview(coachingOverlay)
//
//      NSLayoutConstraint.activate([
//         coachingOverlay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//         coachingOverlay.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//         coachingOverlay.widthAnchor.constraint(equalTo: view.widthAnchor),
//         coachingOverlay.heightAnchor.constraint(equalTo: view.heightAnchor)
//      ])
//
//      setActivatesAutomatically()
//      setGoal()
//   }
//
//   /// - Tag: HideUI
//   func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
//      print("coachingOverlayViewWillActivate")
//      //1. Called When The ARCoachingOverlayView Is Active And Displayed
////      pauseGame()
//   }
//
//   /// - Tag: PresentUI
//   func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
//      print("coachingOverlayViewWillDeactivate")
//      //2. Called When The ARCoachingOverlayView Is No Active And No Longer Displayer
////      unpauseGame()
//   }
//
//   /// - Tag: StartOver
//   func coachingOverlayViewDidRequestSessionReset(_ coachingOverlayView: ARCoachingOverlayView) {
//      print("coachingOverlayViewDidRequestSessionReset")
//      //3. Called When Tracking Conditions Are Poor Or The Seesion Needs Restarting
////      returnToBase()
//
////      let configuration = ARWorldTrackingConfiguration()
////        configuration.planeDetection = [.horizontal, .vertical]
////        session.run(configuration, options: [.resetTracking])
//   }
//
//   /// - Tag: CoachingActivatesAutomatically
//   func setActivatesAutomatically() {
//      coachingOverlay.activatesAutomatically = true
//   }
//
//   /// - Tag: CoachingGoal
//   func setGoal() {
//      coachingOverlay.goal = .verticalPlane
////      coachingOverlay.goal = .tracking
//   }
//}
//
//
//
