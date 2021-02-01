//
//  PushPopViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 26/09/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

class PushPopViewController: UIViewController {
	
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .systemBackground
		
		/// Back
		
		let swipeBack = UISwipeGestureRecognizer(target: self, action: #selector(shouldPop(_:)))
		swipeBack.direction = .right
		view.addGestureRecognizer(swipeBack)
		
		// Adds support for screen edge gestures as well as the swipe back
		if let navSwipe = navigationController?.view.gestureRecognizers?.first as? UIScreenEdgePanGestureRecognizer {
			
			swipeBack.require(toFail: navSwipe)
		}
		
		/// Forward
		
		let swipeForward = UISwipeGestureRecognizer(target: self, action: #selector(shouldPush(_:)))
		swipeForward.direction = .left
		view.addGestureRecognizer(swipeForward)
	}
	
	
	override var prefersStatusBarHidden: Bool {
		
		return true
	}
	
	
	// MARK: Handlers
	
	@objc func shouldPop(_ recognizer: UISwipeGestureRecognizer) {
		
		navigationController?.popViewController(animated: true)
	}
	
	
	@objc func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		/// Override me
	}
	
	
	func pushToViewController(identifier: String) {
		
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let nextViewController = storyboard.instantiateViewController(identifier: identifier)
		
		navigationController?.pushViewController(nextViewController, animated: true)
	}
}
