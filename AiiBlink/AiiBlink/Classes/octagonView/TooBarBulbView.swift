//
//  TooBarBulbView.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/10.
//

import UIKit
import Result
import ReactiveCocoa
import ReactiveSwift

open class TooBarBulbView: UIView {

    /// 选取的颜色值
    public var selectedColor : UIColor = UIColor.white

    /// 灯泡按钮
    private var colorBtns :[UIButton] = []

    let imageNromals = ["black_bulb_normal","white_bulb_normal",
                        "green_bulb_normal","orange_bulb_normal",
                        "yellow_bulb_noraml","cyan_bulb_noraml",
                        "red_bulb_noraml","purple_bulb_nroaml",
                        "bule_bulb_nroaml","pink_bulb_noraml"]

    let imageSelecteds = ["black_bulb_selected","white_bulb_selected",
                          "green_bulb_selected","orange_bulb_selected",
                          "yellow_bulb_selected","cyan_bulb_selected",
                          "red_bulb_selected","purple_bulb_selected",
                          "bule_bulb_selected","pink_bulb_selected"]

    let colors = [0x696969,0xFFFFFF,0x7ED321,0xF5A623,0xF8E71C,
                  0x50E3C2,0xD0021B,0x9013FE,0x4A90E2,0xFF59A9]

    public override init(frame: CGRect) {
        super.init(frame: frame)
        let width = bounds.width
        let height = bounds.height

        colorBtns.removeAll()
        for index in 0..<10 {

            let centerPiont = CGPoint(x:CGFloat((index*2+1)) * (width*0.05), y:height*0.5)
            let colorBtn = UIButton(frame: CGRect(x:0, y:0, width: width*0.1, height:height))
            let nromalImg =  UIImage(named:imageNromals[index], in: Bundle.blinkClassResourceBundle(), compatibleWith:nil)
            let selectedImg =  UIImage(named:imageSelecteds[index], in: Bundle.blinkClassResourceBundle(), compatibleWith:nil)
            colorBtn.setImage(nromalImg, for: .normal)
            colorBtn.setImage(selectedImg, for: .selected)
            colorBtn.center = centerPiont
            addSubview(colorBtn)
            colorBtns.append(colorBtn)
        }

        for (index,btn) in colorBtns.enumerated() {
            btn.reactive.controlEvents(.touchUpInside).observeValues({[weak self] (btn) in
               _ = self?.colorBtns.map({ (btn) -> Void in
                    btn.isSelected = false
                })

                btn.isSelected = true
                self?.selectedColor = UIColor(rgb:(self?.colors[index])!)
            })
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate extension UIColor {

  fileprivate convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat((rgb >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgb >> 8) & 0xFF) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}
