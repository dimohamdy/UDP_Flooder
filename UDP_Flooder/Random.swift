//
//  Random.swift
//  IPFlood
//
//  Created by BinaryBoy on 5/15/17.
//
//

import Foundation

class Random {

   static func getRandomPort() -> Int {
        
        //  Make a variable equal to a random number....
        
        let randomNum:UInt32 = arc4random_uniform(65536) // range is 0 to 65535
        
        // convert the UInt32 to some other  types
        
        let randomTime:TimeInterval = TimeInterval(randomNum)
        
        let someInt:Int = Int(randomNum)
        
        return someInt
    }
    
    static func randomString(length:Int? = 512) -> String {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var c = charSet.characters.map { String($0) }
        var s:String = ""
        for _ in (1...length!) {
            s.append(c[Int(arc4random()) % c.count])
        }
        return s
    }
}
