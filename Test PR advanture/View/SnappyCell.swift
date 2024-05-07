//
//  SnappyCell.swift
//  Test PR advanture
//
//  Created by Miloshevich on 23.10.2023.
//

import UIKit
import Lottie

class SnappyCell: UICollectionViewCell {
    static let reuseID = "TourCell"
    
    
     
     lazy var superImageView: UIImageView = {
         let view = UIImageView()
         view.translatesAutoresizingMaskIntoConstraints = false
         view.contentMode = .scaleAspectFill
         
         return view
     }()
    
//        func animationSetup(animationName: String) {
//        contentView.addSubview(lottieView)
//        lottieView.translatesAutoresizingMaskIntoConstraints = false
//        lottieView.animation = LottieAnimation.named(animationName)
//        lottieView.loopMode = .loop
//        lottieView.contentMode = .scaleAspectFit
//        
//        // lottieView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
//        lottieView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
//        lottieView.topAnchor.constraint(equalTo: superImageView.bottomAnchor, constant: 30).isActive = true
//        lottieView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        lottieView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        lottieView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -90).isActive = true
//        lottieView.heightAnchor.constraint(equalToConstant: 100).isActive = true
//        
//        lottieView.play()
//    }
    
     
     func setupView(){
         contentView.addSubview(superImageView)
         contentView.clipsToBounds = true
         superImageView.layer.cornerRadius = 40
       //  superImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
         superImageView.layer.masksToBounds = true
         superImageView.layer.borderColor = UIColor.white.cgColor
         superImageView.layer.borderWidth = 1
        // animationSetup(animationName: "Animation - 1697723344463")
         
         NSLayoutConstraint.activate([
             superImageView.leadingAnchor.constraint(equalTo:contentView.leadingAnchor),
             superImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             superImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
             superImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
         ])
     }
     
     override init(frame: CGRect) {
         super .init(frame: frame)
         setupView()
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init (coder: aDecoder)
         setupView()
     }
}
