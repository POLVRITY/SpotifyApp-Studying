//
//  NewReleaseCollectionViewCell.swift
//  Spotify
//
//  Created by Admin on 11.12.2022.
//

import UIKit
import SDWebImage

class NewReleaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "NewReleaseCollectionViewCell"
    
    private let albumCoverImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let numberOfTracksLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .thin)
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
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(numberOfTracksLabel)
        contentView.addSubview(artistsNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfTracksLabel.translatesAutoresizingMaskIntoConstraints = false
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            albumCoverImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            albumCoverImageView.widthAnchor.constraint(equalToConstant: contentView.height - 10),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: contentView.height - 10),

            albumNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            albumNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),

            artistsNameLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            artistsNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            artistsNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 5),

            numberOfTracksLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            numberOfTracksLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            numberOfTracksLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumNameLabel.text = nil
        artistsNameLabel.text = nil
        numberOfTracksLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel: NewReleasesCellViewModel) {
        albumNameLabel.text = viewModel.name
        artistsNameLabel.text = viewModel.artistName
        numberOfTracksLabel.text = "Tracks: \(viewModel.numberOfTracks)"
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }
}
