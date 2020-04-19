//
//  ViewController.swift
//  flag-guess
//
//  Created by Vinh Le on 4/18/20.
//  Copyright © 2020 Vinh Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var countries = [String]()
    private var score = 0
    private var answerIndex: Int?
    private var options = [String]()
    
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 0
        button.addTarget(self, action: #selector(handleSelectFlag), for: .touchUpInside)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 1
        button.addTarget(self, action: #selector(handleSelectFlag), for: .touchUpInside)
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 2
        button.addTarget(self, action: #selector(handleSelectFlag), for: .touchUpInside)
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return button
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Score: 0"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        self.title = "Guess the flag"
        view.backgroundColor = .lightGray
        
        renderButtons()
        renderStartButton()
        renderScoreLabel()
    }

    fileprivate func renderButtons() {
        let buttonWidth: CGFloat = view.frame.width*2/3
        let buttonHeight: CGFloat = view.frame.height/6
        
        view.addSubview(button1)
        button1.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: nil, right: nil, paddingTop: 24, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: buttonWidth, height: buttonHeight)
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button2)
        button2.anchor(top: button1.bottomAnchor, bottom: nil, left: nil, right: nil, paddingTop: 24, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: buttonWidth, height: buttonHeight)
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button3)
        button3.anchor(top: button2.bottomAnchor, bottom: nil, left: nil, right: nil, paddingTop: 24, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: buttonWidth, height: buttonHeight)
        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func renderScoreLabel() {
        view.addSubview(scoreLabel)
        scoreLabel.anchor(top: nil, bottom: startButton.topAnchor, left: nil, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: nil, height: nil)
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func renderStartButton() {
        view.addSubview(startButton)
        startButton.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: nil, right: nil, paddingTop: 12, paddingBottom: 12, paddingLeft: 0, paddingRight: 0, width: nil, height: nil)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func handleStart() {
        countries.shuffle()
        answerIndex = Int.random(in: 0..<2)
        options += [countries[0], countries[1], countries[2]]
        
        // Get 2 other random countries and render button background
        button1.setBackgroundImage(UIImage(named: options[button1.tag]), for: .normal)
        button2.setBackgroundImage(UIImage(named: options[button2.tag]), for: .normal)
        button3.setBackgroundImage(UIImage(named: options[button3.tag]), for: .normal)
        
        // Set title to be answer
        self.title = countries[answerIndex!].uppercased()
        scoreLabel.text = "Score: \(String(score))"
    }
    
    @objc func handleSelectFlag(sender: UIButton) {
        var title = ""
        var message = ""
        if sender.tag == answerIndex {
            title = "Correct!"
            message = "You are awesome"
            score += 1
        } else {
            title = "Better luck next time!"
            message = "That is actually flag of \(options[sender.tag].capitalized)"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: handleContinue))
        present(alert, animated: true)
    }
    
    fileprivate func handleContinue(action: UIAlertAction) {
        // Reset data
        options = []
        handleStart()
    }
}

