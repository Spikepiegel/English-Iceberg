//
//  SelectedThemeCell.swift
//  English Trainee
//
//  Created by Николай Лермонтов on 24.02.2023.
//

import UIKit
import SnapKit

final class SelectedThemeCell: UITableViewCell {
    
    static let identifier = "SelectedThemeCell"
    
    ///Word in English
    lazy var wordOriginLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hoefler Text", size: 20)
        return label
    }()
    
    ///Transcription of the word
    lazy var wordTranscriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 15)
        return label
    }()
    ///Word in Russian
    lazy var wordTranslationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hoefler Text", size: 20)
        label.isHidden = true
        return label
    }()
    
    ///Icon which mark the cell with word, which user has learned
    lazy var learnedWordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "done")
        image.isHidden = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    ///Updates cell information. Method is used in cellForRowAt method
    func update(_ word: Word) {
        wordOriginLabel.text = word.origin
        wordTranscriptionLabel.text = word.transcription
        wordTranslationLabel.text = word.translation

        learnedWordImage.isHidden = !(word.isLearned ?? false)
        wordTranslationLabel.isHidden = !(word.translationIsHidden ?? false)
        
    }
}

extension SelectedThemeCell {
    func setupViews() {
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(wordOriginLabel)
        contentView.addSubview(wordTranscriptionLabel)
        contentView.addSubview(wordTranslationLabel)
        contentView.addSubview(learnedWordImage)
    }
    
    func setupConstraints() {
        
        
        wordOriginLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.left.equalTo(contentView).inset(20)
        }
        wordTranscriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(wordOriginLabel.snp_bottomMargin).offset(30)
            make.left.equalTo(contentView).inset(20)
        }
        wordTranslationLabel.snp.makeConstraints { make in
            make.top.equalTo(wordTranscriptionLabel.snp_bottomMargin).offset(30)
            make.left.equalTo(contentView).inset(20)
        }
        learnedWordImage.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp_topMargin).inset(5)
            make.left.equalTo(contentView.snp_rightMargin).inset(30)
            make.right.equalTo(contentView.snp_rightMargin).inset(5)
            make.bottom.equalTo(contentView.snp_topMargin).inset(30)
        }
    }
}
