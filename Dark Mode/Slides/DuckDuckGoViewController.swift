//
//  DuckDuckGoViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 07/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class DuckDuckGoViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "DuckDuckGoViewController"
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let nextViewController = storyboard.instantiateViewController(identifier: WebPagesViewController.title)
//		let nextViewController = storyboard.instantiateViewController(identifier: ThanksViewController.title)
//		let nextViewController = storyboard.instantiateViewController(identifier: InitialViewController.title)
		
		navigationController?.pushViewController(nextViewController, animated: true)
	}
}
