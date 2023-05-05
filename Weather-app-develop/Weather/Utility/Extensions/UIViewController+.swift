//
//  UIViewController+.swift
//  Weather
//
//  Created by Naveen Chowdary on 05/05/23.
//

import Foundation
import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            T(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
