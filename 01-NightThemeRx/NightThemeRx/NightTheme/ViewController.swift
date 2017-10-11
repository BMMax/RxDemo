//
//  ViewController.swift
//  NightThemeRx
//
//  Created by user on 2017/10/9.
//  Copyright © 2017年 mobin. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var changeSwitch: UISwitch!
    var presentViewModel = PresentStyleViewModel(current: Variable(false))
    fileprivate let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureReadModeStyle()
        changeSwitch.rx.isOn.bind(to: presentViewModel.currentStyle).addDisposableTo(disposeBag)
    }
    private func configureReadModeStyle() {
        presentViewModel.presentedStyle.drive(self.view.rx.bgColor).addDisposableTo(disposeBag)
        presentViewModel.presentedStyle.drive(label.rx.textColor).addDisposableTo(disposeBag)
    }

}
