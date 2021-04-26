//
//  ViewController.swift
//  Github Search
//
//  Created by Khaled Mohab on 4/26/21.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {
    var jsContext: JSContext!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeJS()
        self.helloWorld()
        self.jsDemo1()
        self.jsDemo2()
    }

//MARK: - JS controllers
    func initializeJS() {
        self.jsContext = JSContext()
        
        // Add an exception handler.
           self.jsContext.exceptionHandler = { context, exception in
               if let exc = exception {
                   print("JS Exception:", exc.toString())
               }
           }
        
        // Specify the path to the jssource.js file.
        if let jsSourcePath = Bundle.main.path(forResource: "jssource", ofType: "js") {
            do {
                // Load its contents to a String variable.
                let jsSourceContents = try String(contentsOfFile: jsSourcePath)
     
                // Add the Javascript code that currently exists in the jsSourceContents to the Javascript Runtime through the jsContext object.
                self.jsContext.evaluateScript(jsSourceContents)
            }
            catch {
                print(error.localizedDescription)
            }
        }
     
    }
    
    func helloWorld() {
        if let variableHelloWorld = self.jsContext.objectForKeyedSubscript("helloWorld") {
            print(variableHelloWorld.toString())
        }
    }
    
    
    func jsDemo1() {
        let firstname = "Mickey"
        let lastname = "Mouse"
     
        if let functionFullname = self.jsContext.objectForKeyedSubscript("getFullname") {
            // Call the function that composes the fullname.
            if let fullname = functionFullname.call(withArguments: [firstname, lastname]) {
                print(fullname.toString())
            }
        }
    }
    
  
    func jsDemo2() {
        let values = [10, -5, 22, 14, -35, 101, -55, 16, 14]
     
        if let functionMaxMinAverage = self.jsContext.objectForKeyedSubscript("maxMinAverage") {
            if let results = functionMaxMinAverage.call(withArguments: [values]) {
                if let resultsDict = results.toDictionary() {
                    for (key, value) in resultsDict {
                        print(key, value)
                    }
                }
            }
        }
    }
}

