//
//  AlertView.swift
//  Careo
//
//  Created by Karol Stępień on 18.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import SIAlertView
import UIKit

class AlertView: SIAlertView {

    override init(title: String!, andMessage message: String!) {
        super.init(title: title.uppercased(), andMessage: message)
        buttonColor = Colors.primary
        cancelButtonColor = Colors.accent
        destructiveButtonColor = Colors.warn
        backgroundStyle = .solid
        buttonFont = UIFont(name: "GillSans-SemiBold", size: 17.0)
        messageFont = UIFont(name: "GillSans-Light", size: 15.0)
        titleFont = UIFont(name: "GillSans-Light", size: 18.0)
        titleColor = Colors.primary

        messageColor = Colors.primary
        transitionStyle = .fade
    }

    convenience init(title: String!, message: String, cancelButtonTitle: String) {
        self.init(title: title.uppercased(), andMessage: message)
        addButton(withTitle: cancelButtonTitle, type: .default, handler: {
            (SIAlertViewHandler) -> Void in

        })
    }

    convenience init(title: String!, message: String, actionButtonTitle: String, cancelButtonTitle: String, actionCompletion: @escaping () -> Void, cancelCompletion: @escaping () -> Void) {
        self.init(title: title.uppercased(), andMessage: message)
        self.title = title
        self.message = message
        addButton(withTitle: actionButtonTitle, type: .destructive, handler: {
            (SIAlertViewHandler) -> Void in
            actionCompletion()
        })
        addButton(withTitle: cancelButtonTitle, type: .cancel, handler: {
            (SIAlertViewHandler) -> Void in
            cancelCompletion()
        })

        buttonsListStyle = .normal
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

}
