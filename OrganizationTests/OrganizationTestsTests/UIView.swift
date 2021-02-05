//
//  UIView.swift
//  OrganizationTestsTests
//
//  Created by Yago Filipe Albino on 25/01/21.
//  Copyright © 2021 Tests. All rights reserved.
//

import UIKit

extension UIView {
    
    func viewWith(accessibilityIdentifier: String) -> UIView? {
        if self.accessibilityIdentifier == accessibilityIdentifier || accessibilityLabel == accessibilityIdentifier {
            return self
        }

        for subview in subviews {
            if let result = subview.viewWith(accessibilityIdentifier: accessibilityIdentifier) {
                return result
            }
        }
        return nil
    }
}
