//
//  NoAppIconSupportViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 08/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class NoAppIconSupportViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "NoAppIconSupportViewController"
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		pushToViewController(identifier: BlackPowerEfficiencyViewController.title)
	}
}
