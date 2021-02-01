//
//  ThanksViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 08/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class ThanksViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "ThanksViewController"
	
	
	// MARK: View lifecycle
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		let alert = UIAlertController(title: "Thanks for listening!", message: "", preferredStyle: .alert)
		
		let seeYouAction = UIAlertAction(title: "See You Next Time!", style: .default, handler: nil)
		alert.addAction(seeYouAction)
		
		present(alert, animated: true, completion: nil)
	}
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		pushToViewController(identifier: InitialViewController.title)
	}
}
