//
//  RecommendedTrackCollectionViewCell.swift
//  Spotify
//
//  Created by Admin on 11.12.2022.
//

import UIKit

class RecommendedTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommendedTrackCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 4
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let artistsNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistsNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        trackNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            albumCoverImageView.widthAnchor.constraint(equalToConstant: contentView.height - 4),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: contentView.height - 4),
            
            trackNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            trackNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            trackNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            
            artistsNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            artistsNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            artistsNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 5)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        artistsNameLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel: RecommendedTrackCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistsNameLabel.text = viewModel.artistName
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
