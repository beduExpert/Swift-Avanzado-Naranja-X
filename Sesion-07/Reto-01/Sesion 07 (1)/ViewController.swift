//
//  ViewController.swift
//  Sesion 07
//
//  Created by Ivan Alejandro Hernandez Sanchez on 24/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var marioImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tapGestureExample()
        
        marioImage.isUserInteractionEnabled = true

    }
    
    func tapGestureExample() {
        // Initialize Tap Gesture Recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))

        // Add Tap Gesture Recognizer
        marioImage.addGestureRecognizer(tapGestureRecognizer)
        
        
        // Initialize Pan Gesture Recognizer
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))

        // Add Pan Gesture Recognizer
        marioImage.addGestureRecognizer(panGestureRecognizer)
        
        
        
        // Initialize Tap Gesture Recognizer
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))

        // Add Tap Gesture Recognizer
        marioImage.addGestureRecognizer(longPressGestureRecognizer)
            
            
    }

    

    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.4, delay: 0.2, /*options: [.autoreverse],*/ animations: {
                    self.marioImage.alpha = 0.5
                    self.marioImage.center.y = self.marioImage.center.y - 40
                }) { _ in
                    UIView.animate(withDuration: 0.4, delay: 0.1) {
                        self.marioImage.center.y = self.marioImage.center.y + 20
                        self.marioImage.alpha = 1.0
                    }
                }
    }
    
    
    
    //PAN GESTURE
    @objc private func didPan(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            print("Inicio gesture")
        }
        else if sender.state == UIGestureRecognizer.State.ended {
            print("fin gesture")
        }
        
        let translation = sender.translation(in: view)

        guard let gestureView = sender.view else {
            return
        }

        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )

        sender.setTranslation(.zero, in: view)
    }
    
    //LONG PRESS
    @objc private func handleLongPress(_ sender: UILongPressGestureRecognizer) {
            
        guard let gestureView = sender.view else {
            return
        }
            
        if sender.state == UIGestureRecognizer.State.began {
            print("Inicio gesture")
            gestureView.frame.size.height += 50
            gestureView.frame.size.width += 50
        }
        else if sender.state == UIGestureRecognizer.State.ended {
            print("fin gesture")
            gestureView.frame.size.height -= 50
            gestureView.frame.size.width -= 50
        }
    }
            
    
}
