//
//  ContentView.swift
//  ripple
//
//  Created by Lawrence Herman on 7/3/21.
//

import SwiftUI
import RealityKit
import GameController
import SceneKit
import ARKit
import UIKit
//import SpriteKit



struct ContentView : View {
   

   var body: some View {
     
//      ZStack(alignment: .bottom) {
         ARViewContainer().edgesIgnoringSafeArea(.all)
//         testView()
//      }

      
   }
   
   
}




struct ARViewContainer: UIViewRepresentable {

   
   func makeUIView(context: Context) -> ARView {
      print("makeUIView")
      
      print("arview session debug")
      
      let arView = GameView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: false)

      
      
      arView.configureWorldTracking()
      arView.setDebugSettings()
      arView.addGameController()
      arView.addControllerNotifications()
      arView.setupSessionDelegate()
         

      //       arView.scene.findEntity(named: <#T##String#>)
      
      //       let arView = ARView(frame: .zero, cameraMode: .nonAR, automaticallyConfigureSession: true)
      
//      let pointLight = PointLight()
//      pointLight.light.intensity = 100000
//      
//      let lightAnchor = AnchorEntity(world: [-1,0,0])
//      
//      lightAnchor.addChild(pointLight)
//      
//      arView.scene.addAnchor(lightAnchor)
      //
      
      
      //       let camera = PerspectiveCamera()
      
//      let planeMesh = MeshResource.generatePlane(width: 10, height: 10, cornerRadius: 5)
//
      let sphereMesh = MeshResource.generateSphere(radius: 0.2)
//
//      let y = sphereMesh.bounds
//      //       let z = sphereMesh.contents
//      //content?
//
      let sphereMaterial = SimpleMaterial.init(color: .cyan, roughness: 0.2, isMetallic: true)
//
//      let planeMaterial = SimpleMaterial.init(color: .orange, roughness: 0.5, isMetallic: true)
//
//      let planeEntity = ModelEntity(mesh: planeMesh, materials: [planeMaterial])
//
      let sphereEntity = ModelEntity(mesh: sphereMesh, materials: [sphereMaterial])
      
   
      
      
      
//      
//      let planeAnchor = AnchorEntity(world: [0,0,0])
//      
      let sphereAnchor = AnchorEntity(world: [0,0,-1])
//      
//      planeAnchor.addChild(planeEntity)
//      
      sphereAnchor.addChild(sphereEntity)
//      
//      //       arView.scene.addAnchor(planeAnchor)
      arView.scene.addAnchor(sphereAnchor)
//      
      
//             let modelEntity2 = ModelEntity(mesh: sphereMesh, materials: sphereMaterial, collisionShapes: <#T##[ShapeResource]#>, mass: <#T##Float#>)

      
      return arView
      
   }
   
   func updateUIView(_ uiView: ARView, context: Context) {
         
       
            
         
         
        
      print("updateUIView")
   }
   
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
#endif


