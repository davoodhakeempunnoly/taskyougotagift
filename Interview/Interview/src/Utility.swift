//
//  Utility.swift
//  Anywhere iOS
//
//  Created by Davoodul Hakeem on 07/05/22.
//

import Foundation
import UIKit
import MBProgressHUD
class Utility: NSObject {
    static func showLoader(_ view: UIView) {
        let loadingNotification = MBProgressHUD.showAdded(to: view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading"
    }
    static func hideLoader(_ view: UIView) {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
