//
//  Appearance.swift
//  Careo
//
//  Created by Karol Stępień on 17.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func applyAppearance() {
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont(name: "GillSans-SemiBold", size: 20.0)!,
                                                            NSForegroundColorAttributeName: UIColor.white]
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -200), for: UIBarMetrics.default)
        UINavigationBar.appearance().tintColor = Colors.accent
        UINavigationBar.appearance().barTintColor = Colors.primary
    }

}
