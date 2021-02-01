//
//  HandsUpViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 07/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class HandsUpViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "HandsUpViewController"
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		pushToViewController(identifier: DuckDuckGoViewController.title)
	}
}
