//
//  InitialViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 26/09/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class InitialViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "InitialViewController"
	
	
//	// MARK: Properties
//
//	private let titleLabel: UILabel = {
//
//		let label = UILabel()
//		let systemFont = UIFont.systemFont(ofSize: 14, weight: .semibold)
//
//		let font: UIFont
//
//		if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
//
//			font = UIFont(descriptor: descriptor, size: 14)
//		}
//		else { font = systemFont }
//
//		label.font = font
//		label.sizeToFit()
//		return label
//	}()
	
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationController?.setNavigationBarHidden(true, animated: false)
		
		navigationController?.interactivePopGestureRecognizer?.delegate = nil
	}
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		pushToViewController(identifier: HandsUpViewController.title)
	}
}
