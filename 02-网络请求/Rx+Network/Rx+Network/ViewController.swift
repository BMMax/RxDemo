//
//  ViewController.swift
//  Rx+Network
//
//  Created by user on 2017/10/10.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
import RxSwift
import ObjectMapper
import NSObject_Rx


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIProvider.rx.request(.postHomeList(["DisplayCount" : 15])).mapModel(HomeListModel.self).subscribe { (event) in
            switch event {
            case .success(let response):
                print(response.toJSON())
            case .error(let error):
                print(error)
            }
        }.addDisposableTo(rx.disposeBag)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

