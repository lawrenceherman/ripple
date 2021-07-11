//
//  ContentView.swift
//  ripple
//
//  Created by Lawrence Herman on 7/3/21.
//

import SwiftUI
import RealityKit
import ARKit
import Combine






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
      
      let arView = GameView(frame: .zero, cameraMode: .nonAR, automaticallyConfigureSession: false)
      
     

      
      
    
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


