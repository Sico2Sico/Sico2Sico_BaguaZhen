//
//  ViewController.swift
//  AiiBlink
//
//  Created by Sico2Sico on 03/10/2018.
//  Copyright (c) 2018 Sico2Sico. All rights reserved.
//

import UIKit
import AiiBlink

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false

        let tmp = OctagonRootView(frame:CGRect(x:10, y: 64, width:300, height: 300))
        view.addSubview(tmp)

        tmp.transform = tmp.transform.rotated(by:CGFloat.pi*0.125)


        let tmp2 = TooBarBulbView(frame: CGRect(x:0, y: 400, width:view.bounds.width, height:44))
        view.addSubview(tmp2)


        for (index,btn) in tmp.btns.enumerated() {
            btn.reactive.controlEvents(.touchUpInside).observeValues({ (btn) in
                tmp.trapezoidLayers[index].fillColor = tmp2.selectedColor.cgColor
            })
        }
    }


}

