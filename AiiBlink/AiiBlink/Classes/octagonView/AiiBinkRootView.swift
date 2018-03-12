//
//  AiiBinkRootView.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/10.
//

import UIKit

open class AiiBinkRootView: UIView {

    /// 左眼View
    public var leftOctagonView  : OctagonRootView!

    /// 右眼View
    public var rightOctagonView : OctagonRootView!

    /// 灯按钮View
    public var tooBarBulbView   : TooBarBulbView!


    private var  width  :CGFloat!
    private var  height :CGFloat!

    public override init(frame: CGRect) {
        super.init(frame: frame)

        let margin16 = CGFloat(16).scalex()
        width = bounds.width
        height = bounds.height - margin16*2

        var octagonViewSize = height*0.8
        let tooBarHeigth =  height*0.2

        if (octagonViewSize * (2+0.5) + margin16 * 2) > width {
            octagonViewSize = (width - margin16 * 2 ) * 0.4
        }

        leftOctagonView = OctagonRootView(frame: CGRect(x:margin16, y: margin16, 
                                                        width:octagonViewSize , height: octagonViewSize))

        rightOctagonView = OctagonRootView(frame: CGRect(x:(width - margin16 - octagonViewSize), y:margin16,
                                                         width: octagonViewSize, height: octagonViewSize))

        tooBarBulbView = TooBarBulbView(frame: CGRect(x:0, y: height - tooBarHeigth,
                                                      width:width, height:tooBarHeigth))

        addSubview(leftOctagonView)
        addSubview(rightOctagonView)
        addSubview(tooBarBulbView)

        leftOctagonView.transform = leftOctagonView.transform.rotated(by:CGFloat.pi*0.125)
        rightOctagonView.transform = rightOctagonView.transform.rotated(by:CGFloat.pi*0.125)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

public extension CGFloat {

   public func scalex()-> CGFloat {
        return  self * UIScreen.main.bounds.width / 736.0
    }

   public func scaley()-> CGFloat {
        return  self * UIScreen.main.bounds.height / 414.0
    }
}
