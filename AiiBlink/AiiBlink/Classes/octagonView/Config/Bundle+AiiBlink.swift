//
//  Bundle+AiiBlink.swift
//  AiiBlink
//
//  Created by 德志 on 2018/3/10.
//

import UIKit

public extension Bundle {
    public static func blinkClass() -> Bundle{
        return Bundle(for:AiiBlinkClass.self)
    }

    @objc public class func blinkClassResourceBundle() -> Bundle{
        let uiBundle = self.blinkClass()
        let url = uiBundle.url(forResource:"AiiBlink",withExtension: "bundle")!
        return Bundle(url:url)!
    }
}

private class AiiBlinkClass {}

