//
//  TextAlertBuilder.swift
//  fschool_ios
//
//  Created by Rinat Yakhin on 04/05/2018.
//  Copyright © 2018 Altarix. All rights reserved.
//

import UIKit

final class TextAlertBuilder {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

    private lazy var titleTextView: AlertTextView = {
        let textView = AlertTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.inputAccessoryView = nil
        textView.textColor = UIColor.AlertView.textColor
        textView.backgroundColor = .clear
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 18)

        return textView
    }()
    
    private lazy var messageTextView: AlertTextView = {
        let textView = AlertTextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.inputAccessoryView = nil
        textView.textColor = UIColor.AlertView.textColor
        textView.backgroundColor = .clear
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textAlignment = .center
        
        return textView
    }()
    
    init(container: UIView) {
        container.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10),
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            stackView.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10)
            ])
    }
    
    func setTitle(string: String) {
        titleTextView.text = string
        stackView.addArrangedSubview(titleTextView)
    }
    
    func setMessage(string: String) {
        messageTextView.text = string
        stackView.addArrangedSubview(messageTextView)
    }
    
    func intrinsicContentSize() -> CGFloat {
        if titleHeight > 0 && messageHeight > 0 {
            return (titleHeight + messageHeight)
        }
        return titleHeight + messageHeight + 10
    }
    
    private func addText(text: String, textView: UITextView) {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        let text = NSAttributedString(string: text,
                                      attributes: [.paragraphStyle: style])
        textView.attributedText = text
    }


    private var titleHeight: CGFloat {
        guard let font = titleTextView.font, let text = titleTextView.text else {
            return 0
        }
        if text.isEmpty {
            return 0
        }
        let height = estimateFrameForText(text: text, font: font)
        return height
    }

    private var messageHeight: CGFloat {
        guard let font = messageTextView.font, let text = messageTextView.text  else {
            return 0
        }
        if text.isEmpty {
            return 0
        }
        let height = estimateFrameForText(text: text, font: font)
        return height + 40
    }

    
   private func estimateFrameForText(text: String, font: UIFont) -> CGFloat {
        let widht = UIScreen.main.bounds.width * 0.6
        let size = CGSize(width: widht, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributes = [NSAttributedStringKey.font: font]
        let rect = NSString(string: text).boundingRect(with: size,
                                                       options: options,
                                                       attributes: attributes,
                                                       context: nil)
        return rect.height
    }
}

class AlertTextView: UITextView {

    override func layoutSubviews() {
        super.layoutSubviews()
        recenter()
    }
    
    private func recenter() {
        let contenSize = self.sizeThatFits(CGSize(width: self.bounds.size.width, height: 1000))
        let topCorrection = (self.bounds.size.height - contenSize.height * zoomScale) / 2.0
        self.contentOffset = CGPoint(x: 0, y: -topCorrection)
    }
    
}
