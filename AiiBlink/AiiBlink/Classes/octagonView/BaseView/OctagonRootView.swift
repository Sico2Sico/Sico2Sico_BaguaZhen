//
//  OctagonRootView.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/10.
//

import UIKit

public class OctagonRootView: OctagonView {

    ///  八个梯形layer
    var  trapezoidLayers :[CAShapeLayer] = []

    ///  八个按钮
    var  btns:[UIButton] = []


    ///  大圆的路径点集
    private var  bigPoints :[CGPoint] = []

    ///  中心圆的路径点集
    private var  midPoints :[CGPoint] = []

    ///  小圆的路径点集
    private var  smallPoints :[CGPoint] = []

    ///  点击按钮的中心点集
    private var  midCenters :[CGPoint] = []

    /// 三个OctagonView
    private var  bigOctagonView     :OctagonView!
    private var  midOctagonView     :OctagonView!
    private var  smallOctagonView   :OctagonView!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        ///添加其他的三个八边形
        addOtherOctagonView()

        /// 获取每个八边形的转换后的坐标数组
        convertCGPoint()

        /// 绘制
        drawRrapezoid()

        /// view 移除
        removeViews()
    }

    //MARK:- 添加View
    func addOtherOctagonView() {
        let width = bounds.width
        let bigScale = 0.1
        let midScale = 0.4
        let smallScale = 0.7

        // 添加大圆
        bigOctagonView = OctagonView(frame: CGRect(x:0, y: 0,
                                                       width:width*CGFloat(1.0 - bigScale),
                                                       height:width*CGFloat(1.0 - bigScale)))
        bigOctagonView.center = CGPoint(x:width*0.5, y: width*0.5)
        addSubview(bigOctagonView)



        // 添加点击中心线圆
        midOctagonView = OctagonView(frame: CGRect(x:0, y: 0,
                                                       width:width*CGFloat(1.0 - midScale),
                                                       height:width*CGFloat(1.0 - midScale)))
        midOctagonView.center = bigOctagonView.center
        addSubview(midOctagonView)


        // 添加小圆
        smallOctagonView = OctagonView(frame: CGRect(x:0, y: 0,
                                                         width:width*CGFloat(1.0 - smallScale), height:width*CGFloat(1.0 - smallScale)))
        smallOctagonView.center = bigOctagonView.center
        addSubview(smallOctagonView)
    }


    //MARK:-  获取转换坐标系
    func convertCGPoint() {
        bigPoints.removeAll()
        midPoints.removeAll()
        smallPoints.removeAll()
        midCenters.removeAll()

        bigPoints = bigOctagonView.octagonArray.map({[weak self] (point) -> CGPoint in
            return (self?.convert(point, from:self?.bigOctagonView))!
        })

        midPoints = midOctagonView.octagonArray.map({[weak self] (point) -> CGPoint in
            return  (self?.convert(point, from:self?.midOctagonView))!
        })

        smallPoints = smallOctagonView.octagonArray.map({[weak self] (point) -> CGPoint in
            return  (self?.convert(point, from:self?.smallOctagonView))!
        })

        var j = 0
        while j < 8 {
            if j == 7 {
                let tmpPoint1 = CGPoint(x:(midPoints[j].x+midPoints[0].x)*0.5, y: (midPoints[j].y+midPoints[0].y)*0.5)
                midCenters.append(tmpPoint1)
            }else {
                let tmpPoint2 = CGPoint(x:(midPoints[j].x+midPoints[j+1].x)*0.5, y: (midPoints[j].y+midPoints[j+1].y)*0.5)
                midCenters.append(tmpPoint2)
            }
            j = j + 1
        }
    }


    //MARK:- 梯形绘制
    func drawRrapezoid() {
        let btnScale = 0.4

        /// 添加梯形layer
        trapezoidLayers.removeAll()
        var i = 0
        while i < 8 {
            let trapezoidLayer = CAShapeLayer()
            trapezoidLayer.lineWidth = 6.0;
            trapezoidLayer.lineCap = kCALineCapRound;
            trapezoidLayer.lineJoin = kCALineJoinRound;
            trapezoidLayer.strokeColor = UIColor.orange.cgColor
            trapezoidLayer.fillColor = UIColor.green.cgColor
            layer.addSublayer(trapezoidLayer)
            trapezoidLayers.append(trapezoidLayer)

            let trapezoidPath = UIBezierPath()
            trapezoidPath.move(to:bigPoints[i])
            trapezoidPath.addLine(to: bigPoints[i+1])
            trapezoidPath.addLine(to: smallPoints[i+1])
            trapezoidPath.addLine(to: smallPoints[i])
            trapezoidPath.addLine(to: bigPoints[i])
            trapezoidPath.close()
            trapezoidLayer.path = trapezoidPath.cgPath
            i = i+1
        }


         /// 每个梯形上添加按钮
        let btnWidth = width * CGFloat(btnScale*0.5)
        for point in midCenters {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width:btnWidth, height:btnWidth))
            btn.center = point
            btn.backgroundColor = UIColor.clear
            addSubview(btn)
            btns.append(btn)
        }
    }

    //MARK:- 移除多余的layer
    func removeViews() {
        bigOctagonView.removeFromSuperview()
        midOctagonView.removeFromSuperview()
        smallOctagonView.removeFromSuperview()

        bigOctagonView = nil
        midOctagonView = nil
        smallOctagonView = nil
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
