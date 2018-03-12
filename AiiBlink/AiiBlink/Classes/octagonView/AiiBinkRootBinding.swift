

//
//  AiiBinkRootBinding.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/12.
//

import UIKit
import Result
import ReactiveSwift
import ReactiveCocoa

class AiiBinkRootBinding {

    weak var binkRootView    : AiiBinkRootView!
    weak var leftOctagonView : OctagonRootView!
    weak var rightOctagonView: OctagonRootView!
    weak var tooBarBulbView  : TooBarBulbView!

    init(binkRootView : AiiBinkRootView) {
        self.binkRootView = binkRootView
        self.leftOctagonView = binkRootView.leftOctagonView
        self.rightOctagonView = binkRootView.rightOctagonView
        self.tooBarBulbView = binkRootView.tooBarBulbView
        bind()
    }


    func bind() {

        for  (index,btn) in leftOctagonView.btns.enumerated() {
            btn.reactive.controlEvents(.touchUpInside).observeValues({[weak self] (btn) in
                self?.leftOctagonView.trapezoidLayers[index].fillColor = self?.tooBarBulbView.selectedColor.cgColor
            })
        }

        for  (index,btn) in rightOctagonView.btns.enumerated() {
            btn.reactive.controlEvents(.touchUpInside).observeValues({[weak self] (btn) in
                self?.rightOctagonView.trapezoidLayers[index].fillColor = self?.tooBarBulbView.selectedColor.cgColor
            })
        }

    }
}
