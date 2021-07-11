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
import Combine

//let session = myView.session

class GameView : ARView {
   
   var virtualController: GCVirtualController?
   private var sceneEventsUpdateSubscription: Cancellable!
   var sphereEntity: ModelEntity!
   
   override init(frame frameRect: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool) {
      super.init(frame: frameRect, cameraMode: .nonAR, automaticallyConfigureSession: automaticallyConfigureSession)
  
   
      
      
      configureWorldTracking()
      setDebugSettings()
      addGameController()
      addControllerNotifications()
      setupSessionDelegate()
     addCameraEntity()
      addEntities()
      

      
   }
   
   func addEntities() {
      
      //let pointLight = PointLight()
      //pointLight.light.intensity = 100000
      //let lightAnchor = AnchorEntity(world: [-1,0,0])
      //lightAnchor.addChild(pointLight)
      //arView.scene.addAnchor(lightAnchor)
      //let camera = PerspectiveCamera()
      
      
      
      let sphereMesh = MeshResource.generateSphere(radius: 0.2)
      let sphereMaterial = SimpleMaterial.init(color: .cyan, roughness: 0.2, isMetallic: true)
      sphereEntity = ModelEntity(mesh: sphereMesh, materials: [sphereMaterial])
      let sphereAnchor = AnchorEntity(world: .zero)
      sphereAnchor.addChild(sphereEntity)
      scene.addAnchor(sphereAnchor)
      
//      let planeMesh = MeshResource.generatePlane(width: 10, height: 10, cornerRadius: 5)
//      let planeMaterial = SimpleMaterial.init(color: .orange, roughness: 0.5, isMetallic: true)
//      let planeEntity = ModelEntity(mesh: planeMesh, materials: [planeMaterial])
//      let planeAnchor = AnchorEntity(world: [0,0,0])
//      planeAnchor.addChild(planeEntity)
//      arView.scene.addAnchor(planeAnchor)
      
      
      //let modelEntity2 = ModelEntity(mesh: sphereMesh, materials: sphereMaterial, collisionShapes: <#T##[ShapeResource]#>, mass: <#T##Float#>)
      
      
   }
   
   func addCameraEntity() {
      
//      let cameraEntity = PerspectiveCamera()
//      cameraEntity.camera.fieldOfViewInDegrees = 60
//      let cameraAnchor = AnchorEntity(world: .zero)
//      cameraAnchor.addChild(cameraEntity)
//      scene.addAnchor(cameraAnchor)
//
//      let cameraDistance: Float = 3
//      var currentCameraRotation: Float = 0
//      let cameraRotationSpeed: Float = 0.01
     
      sceneEventsUpdateSubscription = scene.subscribe(to: SceneEvents.Update.self) { [self] _ in
//         let x = sin(currentCameraRotation) * cameraDistance
//             let z = cos(currentCameraRotation) * cameraDistance
//             let cameraTranslation = SIMD3<Float>(x, 0, z)
//             let cameraTransform = Transform(scale: .one,
//                                             rotation: simd_quatf(),
//                                             translation: cameraTranslation)
//         cameraEntity.transform = cameraTransform
//             cameraEntity.look(at: .zero, from: cameraTranslation, relativeTo: nil)
//             currentCameraRotation += cameraRotationSpeed
      
         
      
         
//         print(sphereEntity.position)
      
      }
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
