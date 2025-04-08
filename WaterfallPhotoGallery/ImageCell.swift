//
//  ImageCell.swift
//  WaterfallPhotoGallery
//
//  Created by Ahir on 10/12/23.
//

import UIKit

class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    private let imgview: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgview)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("Coder init has been called.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imgview.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imgview.image = nil
    }
    func configure(image: UIImage?) {
        imgview.image = image
    }
}
