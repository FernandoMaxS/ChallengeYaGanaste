//
//  BankTableViewCell.swift
//  ChallengeYaGanaste
//
//  Created by Fernando Maximiliano on 18/05/23.
//

import UIKit

class BankTableViewCell: UITableViewCell,UITextViewDelegate {
    
    let labelBankName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
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
    
    let textViewUrl: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isSelectable = true
        textView.dataDetectorTypes = .link
        return textView
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
        addSubview(textViewUrl)
        
        NSLayoutConstraint.activate([
            labelBankName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            labelBankName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            labelBankName.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            //labelBankName.heightAnchor.constraint(equalToConstant: 80),
            //labelBankName.widthAnchor.constraint(equalToConstant: 80),
            
            labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            labelDescription.topAnchor.constraint(equalTo: labelBankName.bottomAnchor, constant: 12),
            
            labelAge.trailingAnchor.constraint(equalTo: labelBankName.trailingAnchor, constant: -12),
            labelAge.topAnchor.constraint(equalTo: labelBankName.topAnchor),
            
            textViewUrl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            textViewUrl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            textViewUrl.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 12),
            textViewUrl.heightAnchor.constraint(equalToConstant: 24)
            
            
        ])
    }
    
    func configure(_ model: BankObject){
        self.labelBankName.text = model.bankName
        self.labelDescription.text = model.description
        self.labelAge.text = "\(model.age)"
        self.textViewUrl.delegate = self
        let attributedString = NSMutableAttributedString(string: "Links")
        attributedString.addAttribute(.link, value: model.url, range: NSRange(location: 0, length: 5))
     

        
        self.textViewUrl.attributedText  = attributedString
        
        
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
           UIApplication.shared.open(URL)
           return false
       }
    
    
}
