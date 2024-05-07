//
//  TableCell.swift
//  Test PR advanture
//
//  Created by Miloshevich on 24.10.2023.
//

import UIKit

class TableCell: UITableViewCell {

    var tour: Tour? {
        didSet {
            if let tour = tour {
                imageV.image = tour.image
                nameLabel.text  = tour.title
                descriptionLabel.text = tour.description
            }
        }
    }
    
    lazy private var imageV: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        
        return view
    }()
    
    lazy private var nameLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(24)
        label.textColor = .white
        
        return label
    }()
    
    lazy private var descriptionLabel: UILabel = {
       let dscLabel = UILabel()
        dscLabel.translatesAutoresizingMaskIntoConstraints = false
        dscLabel.numberOfLines = 0
        dscLabel.font = dscLabel.font.withSize(13)
        dscLabel.textColor = .white
        
        return dscLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
        setup()
    }
    private func setup() {
        addSubview(imageV)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        NSLayoutConstraint.activate([
            imageV.widthAnchor.constraint(equalToConstant: 100),
            imageV.heightAnchor.constraint(equalToConstant: 100),
            imageV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageV.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            nameLabel.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: imageV.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
