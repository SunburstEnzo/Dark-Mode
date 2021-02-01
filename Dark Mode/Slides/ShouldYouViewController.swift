//
//  ShouldYouViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 08/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class ShouldYouViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "ShouldYouViewController"
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let nextViewController = storyboard.instantiateViewController(identifier: OptOutViewController.title)
		
		navigationController?.pushViewController(nextViewController, animated: true)
	}
}
