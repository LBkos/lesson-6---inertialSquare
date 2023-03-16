//
//  ViewController.swift
//  lesson 6 - inertial square
//
//  Created by Константин Лопаткин on 16.03.2023.
//

import UIKit

class ViewController: UIViewController {
    var squareView: UIView!
    var animator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var snap: UISnapBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createSquare()
        createAnimation()
        createGesture()
    }

    func createSquare() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.layer.backgroundColor = UIColor.systemBlue.cgColor
        squareView.layer.cornerRadius = 16
        squareView.center = view.center
        view.addSubview(squareView)
    }
    
    func createGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hendleTap(tap:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func createAnimation() {
        animator = UIDynamicAnimator(referenceView: view)

        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        snap = UISnapBehavior(item: squareView, snapTo: .init(x: view.center.x, y: view.center.y))
        snap.damping = 1.0
        animator.addBehavior(snap)
        animator.addBehavior(pushBehavior)
    }
    
    @objc func hendleTap(tap: UITapGestureRecognizer) {
        let tapPoint: CGPoint = tap.location(in: view)
        snap.snapPoint = tapPoint
    }

}

