//
//  SayHelloViewController.swift
//  MVVM
//
//  Created by user on 2017/10/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

/// https://gist.github.com/MartinMoizard/449be0d30920010210988f1773a2ca90

import UIKit
import NSObject_Rx
import RxCocoa
import RxSwift

class SayHelloViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var greetingLabel: UILabel!
    private let viewModel = SayHelloViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {
        let inputs = SayHelloViewModel.Input(name: nameTextField.rx.text.orEmpty.asObservable(),
                                             validate: validateButton.rx.tap.asObservable())
        let outputs = viewModel.transform(input: inputs)
        outputs.greeting.drive(greetingLabel.rx.text).disposed(by: rx.disposeBag)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
