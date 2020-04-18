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
    
    let button1: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        self.title = "Guess the flag"
        view.backgroundColor = .white
        
        setupButtons()
        view.addSubview(startButton)
        startButton.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, left: nil, right: nil, paddingTop: 0, paddingBottom: 12, paddingLeft: 0, paddingRight: 0, width: nil, height: nil)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func setupButtons() {
        let buttonWidth: CGFloat = view.frame.width*2/3
        let buttonHeight: CGFloat = view.frame.height/6
        
        view.addSubview(button1)
        button1.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, left: nil, right: nil, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: buttonWidth, height: buttonHeight)
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button2)
        button2.anchor(top: button1.bottomAnchor, bottom: nil, left: nil, right: nil, paddingTop: 24, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: buttonWidth, height: buttonHeight)
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(button3)
        button3.anchor(top: button2.bottomAnchor, bottom: nil, left: nil, right: nil, paddingTop: 24, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: buttonWidth, height: buttonHeight)
        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func handleStart() {
        button2.setBackgroundImage(UIImage(named: "france"), for: .normal)
    }
}

