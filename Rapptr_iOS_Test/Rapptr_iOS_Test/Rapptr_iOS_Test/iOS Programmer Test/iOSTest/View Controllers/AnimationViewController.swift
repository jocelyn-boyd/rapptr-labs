//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     **/
    
    //MARK: - Outlets
    @IBOutlet weak var logoImage: UIImageView!
    
    //MARK: - Properties
    private var logoPanGesture = UIPanGestureRecognizer()
    private var featherPanGesture = UIPanGestureRecognizer()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        addGesture()
    }
    
    // MARK: - Actions
    @IBAction func didPressFade(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.logoImage.alpha = 1
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = true
        
        UIView.transition(with: view, duration: 2, options: .transitionCrossDissolve, animations: {
            let backgroundColor = UIColor(red: 52/255, green: 169/255, blue: 207/255, alpha: 1)
            self.view.backgroundColor = backgroundColor
        }, completion: nil)
    }
    
    
    // MARK: - Private Methods
    private func configureViewController() {
        logoImage.alpha = 0
        title = "Animation"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reset", style: .done, target: self, action: #selector(resetButtonTapped))
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        view.backgroundColor = UIColor.getUIViewBackgroundColor()
    }
    
    private func addGesture() {
        logoImage.isUserInteractionEnabled = true
        logoPanGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        logoImage.addGestureRecognizer(logoPanGesture)
    }
    
    // MARK: - @objc Methods
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
       
        if gesture.state == .changed {
            let translation = gesture.translation(in: self.logoImage)
            logoImage.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
        }
        else if gesture.state == .ended {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseIn) {
                self.logoImage.transform = .identity
            }
        }
    }
    
    @objc func resetButtonTapped() {
        logoImage.alpha = 0
        view.backgroundColor = UIColor.getUIViewBackgroundColor()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
}
