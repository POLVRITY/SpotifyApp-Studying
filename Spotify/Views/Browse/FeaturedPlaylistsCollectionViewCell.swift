//
//  FeaturedPlaylistsCollectionViewCell.swift
//  Spotify
//
//  Created by Admin on 11.12.2022.
//

import UIKit

class FeaturedPlaylistsCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedPlaylistsCollectionViewCell"
    
    private let playlistCoverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private let creatorNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15, weight: .thin)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.addSubview(creatorNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        creatorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        playlistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        playlistCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            playlistCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            playlistCoverImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playlistCoverImageView.widthAnchor.constraint(equalToConstant: contentView.width - 70),
            playlistCoverImageView.heightAnchor.constraint(equalToConstant: contentView.height - 70),
            
            playlistNameLabel.topAnchor.constraint(equalTo: playlistCoverImageView.bottomAnchor, constant: 5),
            playlistNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            playlistNameLabel.widthAnchor.constraint(equalToConstant: contentView.width),
            playlistNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            creatorNameLabel.topAnchor.constraint(equalTo: playlistNameLabel.bottomAnchor),
            creatorNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            creatorNameLabel.widthAnchor.constraint(equalToConstant: contentView.width),
            creatorNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistNameLabel.text = nil
        creatorNameLabel.text = nil
        playlistCoverImageView.image = nil
    }
    
    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        playlistNameLabel.text = viewModel.name
        creatorNameLabel.text = viewModel.creatorName
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
