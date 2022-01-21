//
//  DSBackgroundColor.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import UIKit

public enum DSBackgroundColor {
    case clear
    case mainScreen
    case divider
    
    func getColor() -> UIColor {
        switch self {
        case .clear:
            return UIColor.clear
        case .mainScreen:
            let mainBackgroundColorName: String = "MainBackground"
            return UIColor(named: mainBackgroundColorName, in: bundle, compatibleWith: nil) ?? UIColor.white
        case .divider:
            let dividerColorName: String = "Divider"
            return UIColor(named: dividerColorName, in: bundle, compatibleWith: nil) ?? UIColor.lightGray
        }
    }
}
