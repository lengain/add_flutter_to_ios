//
//  ORFlutterViewController.swift
//  Original
//
//  Created by 童玉龙 on 2021/12/21.
//

import Flutter
import FlutterPluginRegistrant


class ORFlutterViewController: FlutterViewController, UIGestureRecognizerDelegate {
    
    static func flutterViewController() -> ORFlutterViewController {
        
        let flutterViewController =
        ORFlutterViewController(engine: FlutterEngineManager.manager.flutterEngine(), nibName: nil, bundle: nil)
        return flutterViewController;
    }
    
    static func normalViewController() -> ORFlutterViewController {
        let flutterViewController = self.flutterViewController();
        flutterViewController.channel?.invokeMethod("normal", arguments: nil)
        return flutterViewController
    }
    
    static func parameterViewController(title:String) -> ORFlutterViewController {
        let flutterViewController = self.flutterViewController();
        flutterViewController.channel?.invokeMethod("parameter", arguments: title)
        return flutterViewController
    }
    
    static func callbackViewController(title:String,callback:@escaping ((Any) -> Void)) -> ORFlutterViewController {
        let flutterViewController = self.flutterViewController();
        flutterViewController.channel?.invokeMethod("callbackView", arguments: title)
        flutterViewController.callBack = callback
        //callback
        return flutterViewController
    }

    var channel: FlutterMethodChannel?
    var callBack : ((Any) -> Void)?

    override init(engine: FlutterEngine, nibName: String?, bundle nibBundle: Bundle?) {
        super.init(engine: engine, nibName: nibName, bundle: nibBundle)
        self.channel = FlutterMethodChannel(
            name: "page-router", binaryMessenger: self.engine!.binaryMessenger)
        self.channel?.setMethodCallHandler({[weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            switch call.method {
            case "backButtonAction":
                self?.navigationController?.popViewController(animated: true)
            case "callback":
                self?.callBack?(call.arguments as Any)
            case "original":

                self?.navigationController?.pushViewController(UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController"), animated: true)
            default:
                break
            }

        })
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
    }
    
    deinit {
        if self.engine != nil {
            FlutterEngineManager.manager.destoryFlutter(engine: self.engine!)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
