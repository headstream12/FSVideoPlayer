//
//  AlertControllerTransition.swift
//  fschool_ios
//
//  Created by Rinat Yahin on 10/04/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

final class AlertControllerTransition: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    private let duration = 0.1
    private var isPresenting = false
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) else { return }
        guard let toView = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else { return }

        let container = transitionContext.containerView
        
        if isPresenting {
            container.addSubview(toView.view)
            UIView.animate(withDuration: duration, animations: {
                toView.view.alpha = 1
                fromView.view.alpha = 0.8
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }else {
            UIView.animate(withDuration: duration, animations: {
                toView.view.alpha = 1.0
            }) { (_) in
                fromView.view.removeFromSuperview()
                transitionContext.completeTransition(true)
            }
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }
}
