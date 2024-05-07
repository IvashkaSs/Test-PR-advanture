//
//  BlureBackGround.swift
//  Test PR advanture
//
//  Created by Miloshevich on 23.10.2023.
//
import UIKit

class BlurBackView: UIView {
    var image: UIImage? {
        didSet {
            self.backImageView.image = image
        }
    }
    
    lazy private var backImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    lazy private var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//    lazy private var blurView: UIVisualEffectView = {
//        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//        effectView.translatesAutoresizingMaskIntoConstraints = false
//        return effectView
//    }()
//
//    private func setup() {
//        addSubview(backImageView)
//        addSubview(blurView)
//        NSLayoutConstraint.activate([
//            backImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            backImageView.topAnchor.constraint(equalTo: topAnchor),
//            backImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            blurView.topAnchor.constraint(equalTo: topAnchor),
//            blurView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//    }
    
        private func setup() {
            addSubview(backImageView)
            addSubview(blurView)
            NSLayoutConstraint.activate([
                backImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                backImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                backImageView.topAnchor.constraint(equalTo: topAnchor),
                backImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
                
                blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
                blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
                blurView.topAnchor.constraint(equalTo: topAnchor),
                blurView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
        }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        setup()
    }
}
