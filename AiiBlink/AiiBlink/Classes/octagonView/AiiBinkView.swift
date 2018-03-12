//
//  AiiBinkView.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/12.
//

import UIKit

open class AiiBinkView: UIView {

    var  binkRootView : AiiBinkRootView!

    var  allBtn : UIButton!

    var  copyBtn : UIButton!

    var  binkRootBinding : AiiBinkRootBinding!

    public override init(frame: CGRect) {
        super.init(frame: frame)

        let width = bounds.width
        let height = bounds.height

        let margin64 = CGFloat(64.0).scalex()
        let margin16 = CGFloat(16.0).scaley()

        let btnSize = CGSize(width:CGFloat(46.0).scalex(), height:CGFloat(36.0).scaley())

        binkRootView = AiiBinkRootView(frame: CGRect(x:margin64, y:0,
                                                     width:width-margin64*2, height:height))

        allBtn = UIButton(frame: CGRect(x: width - btnSize.width , y:margin16 ,
                                        width: btnSize.width, height: btnSize.height))


        copyBtn = UIButton(frame: CGRect(x: width - btnSize.width , y:height - margin64 ,
                                         width: btnSize.width, height: btnSize.height))

        addSubview(binkRootView)
        addSubview(allBtn)
        addSubview(copyBtn)

        allBtn.setTitle("All", for: .normal)
        allBtn.backgroundColor = UIColor.orange
        allBtn.setTitleColor(UIColor.white, for: .normal)
        allBtn.titleLabel?.font = UIFont.systemFont(ofSize:14.0)

        allBtn.layer.cornerRadius = 3.0
        allBtn.layer.borderWidth = 1
        allBtn.layer.borderColor = UIColor.orange.cgColor
        allBtn.layer.masksToBounds = true


        copyBtn.setTitle("Copy", for: .normal)
        copyBtn.backgroundColor = UIColor.clear
        copyBtn.setTitleColor(UIColor.black, for: .normal)
        copyBtn.titleLabel?.font = UIFont.systemFont(ofSize:14.0)

        copyBtn.layer.cornerRadius = 3.0
        copyBtn.layer.borderWidth = 3
        copyBtn.layer.borderColor = UIColor.orange.cgColor
        copyBtn.layer.masksToBounds = true

        bind()

        backgroundColor = UIColor(red: 243/255, green: 229/255, blue:219/255, alpha: 1)

    }


    func bind() {
        binkRootBinding = AiiBinkRootBinding(binkRootView:binkRootView)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
