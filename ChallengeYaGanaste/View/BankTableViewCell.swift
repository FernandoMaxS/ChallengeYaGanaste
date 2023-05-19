//
//  BankTableViewCell.swift
//  ChallengeYaGanaste
//
//  Created by Fernando Maximiliano on 18/05/23.
//

import UIKit
import Kingfisher
class BankTableViewCell: UITableViewCell {
    
    let labelBankName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "HelveticaNeue", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelAge: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let urlImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(labelBankName)
        addSubview(labelDescription)
        addSubview(labelAge)
        addSubview(urlImageView)
        
        NSLayoutConstraint.activate([
            urlImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            urlImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            urlImageView.heightAnchor.constraint(equalToConstant: 80),
            urlImageView.widthAnchor.constraint(equalToConstant: 80),
            
            labelBankName.leadingAnchor.constraint(equalTo: urlImageView.trailingAnchor, constant: 20),
            labelBankName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            labelBankName.topAnchor.constraint(equalTo: urlImageView.topAnchor),
            
            
            labelDescription.leadingAnchor.constraint(equalTo: urlImageView.trailingAnchor, constant: 20),
            labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            labelDescription.topAnchor.constraint(equalTo: labelBankName.bottomAnchor, constant: 12),
            
            labelAge.trailingAnchor.constraint(equalTo: labelBankName.trailingAnchor, constant: -6),
            labelAge.topAnchor.constraint(equalTo: labelBankName.topAnchor, constant: 8),
    
            
            
        ])
    }
    
    func configure(_ model: BankObject){
        self.labelBankName.text = model.bankName
        self.labelDescription.text = model.description
        self.labelAge.text = "\(model.age)"
        self.urlImageView.kf.setImage(with: URL(string: model.url))
        
        
    }
    
}

