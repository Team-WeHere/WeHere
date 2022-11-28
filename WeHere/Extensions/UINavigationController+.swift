//
//  UINavigationController+.swift
//  WeHere
//
//  Created by Inho Choi on 2022/11/29.
//

import UIKit

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
