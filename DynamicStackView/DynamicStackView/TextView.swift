//
//  TextView.swift
//  DynamicStackView
//
//  Created by Balaji U on 04/06/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class TextView: UITextView {
        
        override init(frame: CGRect, textContainer: NSTextContainer?) {
            super.init(frame: frame, textContainer: textContainer)
            setupTextView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupTextView()
        }
        
    //func setupTextView(textHexf : String?, bgHexf: String?)
    func setupTextView(){
            
        backgroundColor = .lightGray
        font = .systemFont(ofSize: 30)
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = true
        sizeToFit()
        isScrollEnabled = false
            
        }
//    func textViewDidChange(_ textView: UITextView) {
//          let fixedWidth = textView.frame.size.width
//          textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//          let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//          var newFrame = textView.frame
//          newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//          textView.frame = newFrame
//    }
    
    
}

