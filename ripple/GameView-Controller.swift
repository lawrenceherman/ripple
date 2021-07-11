//
//  GameView-Controller.swift
//  ripple
//
//  Created by Lawrence Herman on 7/10/21.
//

import Foundation
import GameController


extension GameView {
   
   
func addGameController() {
   
   let virtualConfiguration = GCVirtualControllerConfiguration()
   
   virtualConfiguration.elements = [GCInputLeftThumbstick, GCInputRightThumbstick, GCInputButtonA, GCInputButtonB]

   // whats up with these no uI becomes visible
//   GCInputButtonMenu, GCInputButtonOptions, GCInputButtonHome
  // GCInputLeftThumbstickButton  L3?
  
   virtualController = GCVirtualController(configuration: virtualConfiguration)
   
   virtualController?.connect { [self] error in
      if error == nil { print("error nill")}
   }

}
   

func addControllerNotifications() {
   NotificationCenter.default.addObserver(forName: NSNotification.Name.GCControllerDidConnect, object: nil, queue: nil) { (note) in
      
      
      guard let _controller = note.object! as? GCController else { return }
      
//      _controller.controller?.extendedGamepad?.valueChangedHandler! {}
      
      
      let movementHandler: GCControllerDirectionPadValueChangedHandler = { [unowned self] _, xValue, yValue in
         print(xValue)
         print(yValue)
        }
      
      let gcInputButtonAHandler: GCControllerButtonValueChangedHandler = {x, y, z
         in
         print(x)
         print(y)
         print(z)
      }
      
      let gcInputRightThumbstickHandler: GCControllerDirectionPadValueChangedHandler = {x, y, z
         in
      
         self.sphereEntity.position = SIMD3(x: y, y: z, z: -0.1)
         
         print(x)
         print(y)
         print(z)
      }
      

      _controller.extendedGamepad?.dpad.valueChangedHandler = movementHandler
      _controller.extendedGamepad?.leftThumbstickButton?.valueChangedHandler = gcInputButtonAHandler
      
      _controller.extendedGamepad?.rightThumbstick.valueChangedHandler = gcInputRightThumbstickHandler
      
      print ("notification center GCcontroller did connect")
      print(note.object.debugDescription)
      
    
 
      
   }
   
   NotificationCenter.default.addObserver(forName: NSNotification.Name.GCControllerDidDisconnect, object: nil, queue: nil) { (note) in
      print("notification center GCController did disconnect")
      print(note.object.debugDescription)
   }
   
   

}
   
}
