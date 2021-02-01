//
//  WebPagesViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 08/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit

final class WebPagesViewController: PushPopViewController {
	
	
	// MARK: Statics
	
	static let title = "WebPagesViewController"
	
	
	// MARK: Properties
	
	@IBOutlet weak var pressReleaseImageView: UIImageView!
	@IBOutlet weak var appleSiteImageView: UIImageView!
	@IBOutlet weak var higImageView: UIImageView!
	
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		pressReleaseImageView.alpha = 0
		appleSiteImageView.alpha = 0
		higImageView.alpha = 0
		
		pressReleaseImageView.clipsToBounds = false
		appleSiteImageView.clipsToBounds = false
		higImageView.clipsToBounds = false
		
		pressReleaseImageView.layer.shadowOpacity = 0.5
		appleSiteImageView.layer.shadowOpacity = 0.5
		higImageView.layer.shadowOpacity = 0.5
		
		pressReleaseImageView.layer.shadowOffset = .zero
		appleSiteImageView.layer.shadowOffset = .zero
		higImageView.layer.shadowOffset = .zero
		
		pressReleaseImageView.layer.shadowRadius = 6
		appleSiteImageView.layer.shadowRadius = 6
		higImageView.layer.shadowRadius = 6
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
		view.addGestureRecognizer(tap)
	}
	
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { [weak self] in
			
			guard let weakSelf = self else { return }
			
			weakSelf.pressReleaseImageView.alpha = 1
			
		}, completion: nil)
	}
	
	
	// MARK: Handlers
	
	@objc private func handleTap(_ recognizer: UITapGestureRecognizer) {
		
		UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: { [weak self] in
			
			guard let weakSelf = self else { return }
			
			if weakSelf.appleSiteImageView.alpha < 0.8 {
				
				weakSelf.appleSiteImageView.alpha = 1
			}
			else if weakSelf.higImageView.alpha < 0.8 {
				
				weakSelf.higImageView.alpha = 1
			}
			
		}, completion: nil)
	}
	
	
	// MARK: Gestures
	
	override func shouldPush(_ recognizer: UISwipeGestureRecognizer) {
		
		pushToViewController(identifier: AutoothMainComparisonViewController.title)
	}
}
