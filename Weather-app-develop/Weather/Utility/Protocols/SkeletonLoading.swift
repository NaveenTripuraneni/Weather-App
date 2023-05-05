//
//  SkeletonLoading.swift
//  Weather
//
//  Created by Naveen Chowdary on 05/05/23.
//

import UIKit
import SkeletonView

protocol SkeletonLoading {
    var skeletableViews: [UIView] { get }

    func updateSkeletonDesign(isEnding: Bool)
}

extension SkeletonLoading {
    /// Call to begin skeleton animation
    func startSkeletonLoading() {
        DispatchQueue.main.async {
            self.updateSkeletonDesign(isEnding: false)
            self.skeletableViews.forEach { view in
                view.isSkeletonable = true
                view.showAnimatedGradientSkeleton()

                if let textView = view as? UILabel {
                    textView.linesCornerRadius = 8
                }
            }
        }
    }

    /// Call after data to be shown is available
    func stopSkeletonLoading() {
        DispatchQueue.main.async {
            self.skeletableViews.forEach { view in
                view.hideSkeleton()
            }
            self.updateSkeletonDesign(isEnding: true)
        }
    }
}
