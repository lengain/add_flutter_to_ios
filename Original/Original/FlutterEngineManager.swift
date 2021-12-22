//
//  FlutterEngineManager.swift
//  Original
//
//  Created by 童玉龙 on 2021/12/22.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class FlutterEngineManager: NSObject {
    public static let manager = FlutterEngineManager();
    
    let engines = FlutterEngineGroup(name: "Original", project: nil)
    
    
    private var preEngineArray : [FlutterEngine] = [];
    private var activeEngineArray : [FlutterEngine] = [];
    
    static func preload() {
        self.manager.generateFlutterEngine()
    }
    
    private func generateFlutterEngine() {
        let flutterEngine = engines.makeEngine(withEntrypoint: nil, libraryURI: nil)
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: flutterEngine)
        preEngineArray.append(flutterEngine)
    }
    
    func flutterEngine() -> FlutterEngine {
        let flutterEngine = preEngineArray.first;
        preEngineArray.removeFirst()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
            self.generateFlutterEngine()
            self.activeEngineArray.append(flutterEngine!)
        }
        return flutterEngine!
    }
    
    func destoryFlutter(engine : FlutterEngine)  {
        activeEngineArray.removeAll { $0 == engine }
    }
    
}
