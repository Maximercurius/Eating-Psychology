//
//  EPImageView.swift
//  Eating Psychology
//
//  Created by Makarov_Maxim on 09.10.2022.
//

import UIKit

class EPImageView: UIImageView {

    
    let placeholderImage = UIImage.init(systemName: "fork.knife.circle")!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
