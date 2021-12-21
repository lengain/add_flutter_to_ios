//
//  ViewController.swift
//  Original
//
//  Created by 童玉龙 on 2021/12/21.
//

import UIKit
import Flutter

struct ViewModel {
    var title : String
    var action : ((UINavigationController?) -> Void)
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    private let modelArray : [ViewModel] = [
        ViewModel(title: "Push normal view controller", action: { nvc in
            nvc?.pushViewController(ORFlutterViewController.normalViewController(), animated: true)
        }),
        
        ViewModel(title: "Push view controller with parameters", action: { nvc in
            nvc?.pushViewController(ORFlutterViewController.parameterViewController(title: "TitleA"), animated: true)
        }),
        
        ViewModel(title: "Push view controller with callback", action: { nvc in
            nvc?.pushViewController(ORFlutterViewController.callbackViewController(title: "TitleB",callback: { callback in
                print("callbackViewController:\(callback)")
            }), animated: true)
        }),
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Original"
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = modelArray[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        modelArray[indexPath.row].action(self.navigationController)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

