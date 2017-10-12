//
//  SayHelloViewModel.swift
//  MVVM
//
//  Created by user on 2017/10/12.
//  Copyright © 2017年 mobin. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SayHelloViewModel: ViewModelType {

    struct Input {

        let name: Observable<String>
        let validate: Observable<Void>
    }

    struct Output {
        let greeting: Driver<String>
    }
    
    func transform(input: Input) -> Output {
        
        //when “Validate” is hit, we take the last value of the input text field to create the Hello \(name) string.
        let greeting = input.validate
                                .withLatestFrom(input.name)
                                .map { return "Hello \($0)"}
                                .startWith("")
                                .asDriver(onErrorJustReturn: ":-(")
        return Output(greeting: greeting)
    }
}


final class  OptimizeSayHelloViewModel: OptimizeViewModelType {

    let input: Input
    let output: Output
    
    struct Input {
        let name: AnyObserver<String>
        let validate: AnyObserver<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    private let nameSubject = ReplaySubject<String>.create(bufferSize: 1)
    private let validateSubject = PublishSubject<Void>() 
    
    init() {
        let greeting = validateSubject
            .withLatestFrom(nameSubject)
            .map { return "Hello \($0)!"}
            .asDriver(onErrorJustReturn: ":-(")
        
        self.output = Output(greeting: greeting)
        self.input  = Input(name: nameSubject.asObserver(), validate: validateSubject.asObserver())
    }
}
