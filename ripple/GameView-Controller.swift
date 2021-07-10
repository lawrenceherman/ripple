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
   
   virtualConfiguration.elements = [GCInputDirectionPad, GCInputButtonHome, GCInputButtonMenu, GCInputRightThumbstick, GCInputButtonA, GCInputButtonB, GCInputButtonOptions]


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
         print(x)
         print(y)
         print(z)
      }
      
      // wont work
//      let gcInputButtonAHandler: GCControllerButtonTouchedChangedHandler = {
//         w,x,y,z
//         in
//         print(w)
//         print(x)
//         print(y)
//         print(z)
//
//      }

      _controller.extendedGamepad?.dpad.valueChangedHandler = movementHandler
      _controller.extendedGamepad?.buttonA.valueChangedHandler = gcInputButtonAHandler
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
