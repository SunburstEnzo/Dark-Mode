//
//  SpeechViewController.swift
//  Dark Mode
//
//  Created by Aled Samuel on 01/10/2019.
//  Copyright © 2019 Aled Samuel. All rights reserved.
//

import UIKit
import Speech

final class SpeechViewController: UIViewController, SFSpeechRecognizerDelegate {
	
	
	@IBOutlet weak var textView: UITextView!
	
	@IBOutlet weak var microphoneButton: UIButton!
	
	private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-GB"))!
	
	private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
	private var recognitionTask: SFSpeechRecognitionTask?
	private let audioEngine = AVAudioEngine()
	
	
	// MARK: View lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		speechRecognizer.delegate = self
		speechRecognizer.supportsOnDeviceRecognition = true
		
		SFSpeechRecognizer.requestAuthorization { (authStatus) in
			
			var isButtonEnabled = false
			
			switch authStatus {
			case .authorized:
				isButtonEnabled = true
				
			case .denied:
				isButtonEnabled = false
				print("User denied access to speech recognition")
				
			case .restricted:
				isButtonEnabled = false
				print("Speech recognition restricted on this device")
				
			case .notDetermined:
				fallthrough
				
			@unknown default:
				isButtonEnabled = false
				print("Speech recognition not yet authorized")
			}
			
			OperationQueue.main.addOperation() {
				self.microphoneButton.isEnabled = isButtonEnabled
			}
		}
	}
	
	
	// MARK: Handlers
	
	@IBAction func handleStartButton(_ sender: Any) {
		
		if audioEngine.isRunning {
			audioEngine.stop()
			recognitionRequest?.endAudio()
			microphoneButton.isEnabled = false
			microphoneButton.setTitle("Start", for: .normal)
		} else {
			startRecording()
			microphoneButton.setTitle("Stop", for: .normal)
		}
	}
	
	
	// MARK: Audio
	
	func startRecording() {
		
		if recognitionTask != nil {
			
			recognitionTask?.cancel()
			recognitionTask = nil
		}
		
		let audioSession = AVAudioSession.sharedInstance()
		
		do {
			try audioSession.setCategory(AVAudioSession.Category.record)
			try audioSession.setMode(AVAudioSession.Mode.measurement)
			try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
		} catch {
			print("audioSession properties weren't set because of an error.")
		}
		
		recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
		
		let inputNode = audioEngine.inputNode
		
		guard let recognitionRequest = recognitionRequest else {
			fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
		}
		
		recognitionRequest.shouldReportPartialResults = true
		
		recognitionTask = speechRecognizer.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
			
			var isFinal = false
			
			if result != nil {
				
				self.textView.text = result?.bestTranscription.formattedString
				
				self.textView.scrollRangeToVisible(NSRange(location: self.textView.text.count - 1, length: 1))
				
				isFinal = (result?.isFinal)!
			}
			
			if error != nil || isFinal {
				
				self.audioEngine.stop()
				inputNode.removeTap(onBus: 0)
				
				self.recognitionRequest = nil
				self.recognitionTask = nil
				
				self.microphoneButton.isEnabled = true
			}
		})
		
		let recordingFormat = inputNode.outputFormat(forBus: 0)
		
		inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
			
			self.recognitionRequest?.append(buffer)
		}
		
		audioEngine.prepare()
		
		do {
			try audioEngine.start()
		} catch {
			print("audioEngine couldn't start because of an error.")
		}
		
		textView.text = "Ready..."
	}
	
	
	func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
		
		microphoneButton.isEnabled = available
	}
}
