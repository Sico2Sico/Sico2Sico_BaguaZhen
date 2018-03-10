//
//  OctagonView.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/10.
//

import UIKit

public class OctagonView: UIView {

    //／ 显示八边型的layer
    var octagonLayer :CAShapeLayer!

    /// 显示八边形的路径
    var octagonPath : UIBezierPath!

    /// 当前路径的点集
    public var octagonArray : [CGPoint] =  []

    /// 当前View的宽度 需要注意的是 当前View必须是一个正方形（width == height）
    var width : CGFloat!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        width = self.bounds.width
    
        // 获取八边形的点数据集合
        getOctagonArrayData()

        // 设置layer
        octagonLayer = CAShapeLayer()
        octagonLayer.lineWidth = 5.0;
        octagonLayer.lineCap = kCALineCapRound;
        octagonLayer.lineJoin = kCALineJoinRound;
        octagonLayer.strokeColor = UIColor.black.cgColor
        octagonLayer.fillColor = UIColor.orange.cgColor
        layer.addSublayer(octagonLayer)

        // 设置路径
        octagonPath = UIBezierPath()
        for (index,vlaue) in octagonArray.enumerated() {
            if index == 0 {
                octagonPath.move(to: vlaue)
            }
            octagonPath.addLine(to: vlaue)
        }

        octagonPath.close()
        octagonLayer.path = octagonPath.cgPath
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK:- 获取当前View内切八边形的点集合
    func getOctagonArrayData(){

        // 计算得到八边形的边长 （也可以理解为一个矩形的高度 其实八变形可以理解为
        // 是八个矩形按照一定的角度旋转合成的）
        let itemHeight = width*tan(CGFloat.pi*0.125) // ((360/8)/2)

        //  获取到 View起点到 边 开始的距离 每一边都有一样的两段
        let itemMin = (width - itemHeight)*0.5


        octagonArray.removeAll()
        octagonArray.append(CGPoint(x: itemMin, y: 0))
        octagonArray.append(CGPoint(x: itemMin+itemHeight, y: 0))

        octagonArray.append(CGPoint(x: width, y: itemMin))
        octagonArray.append(CGPoint(x: width, y: itemMin+itemHeight))

        octagonArray.append(CGPoint(x: itemMin+itemHeight, y: width))
        octagonArray.append(CGPoint(x: itemMin, y: width))

        octagonArray.append(CGPoint(x: 0, y: itemMin+itemHeight))
        octagonArray.append(CGPoint(x: 0, y: itemMin))
        octagonArray.append(CGPoint(x: itemMin, y: 0))
    }


}
