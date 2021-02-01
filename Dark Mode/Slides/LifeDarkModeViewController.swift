//
//  LifeDarkModeViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 10/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class LifeDarkModeViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "LifeDarkModeViewController"
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let nextViewController = storyboard.instantiateViewController(identifier: ThanksViewController.title)
		
		navigationController?.pushViewController(nextViewController, animated: true)
	}
}
