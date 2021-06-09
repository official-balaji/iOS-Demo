//
//  ViewController.swift
//  DynamicStackView
//
//  Created by Balaji U on 04/06/21.
//  Copyright © 2021 Balaji U. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stackView = UIStackView()
    var refVm = ViewModel()
    var indexNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refVm.parse()
        configureStackView()
        
        
    }

    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
        addTextView()
        setStackViewConstraints()
    }
    
    func addTextView() {
        let resultData = refVm.data
        let count = resultData.count
        indexNumber = count
        for i in 0..<count{
            
            if resultData[i].type == "text"{
                    let elementNumber = i+1
                    let elementText = resultData[i].source
                    let elementTextColor = refVm.hexStringToUIColor(hex: resultData[i].textColor)
                    let elementBgColor = refVm.hexStringToUIColor(hex: resultData[i].backgroundColor)
                    let fontSize = Int(resultData[i].fontSize) ?? 16
                    buildTextArea(textColor: elementTextColor, bgColor: elementBgColor, source: elementText, element: elementNumber, fontSize: fontSize)
            }
            else{
                    let elementNumber = i+1
                    let sourceImg = resultData[i].sourceImg
                    let height = resultData[i].Height
                    let width = resultData[i].width
                    buildImageArea(elementNumber: elementNumber, sourceImg: sourceImg, height: height, width: width )
            }
            
            }
        
    }
    
    func buildTextArea(textColor: UIColor, bgColor: UIColor, source: String, element: Int, fontSize : Int){
        let tx = TextView()
        
        tx.backgroundColor = bgColor
        tx.frame = CGRect(x: 10, y: 25, width: self.view.frame.width, height: 100)
        
        let attributeOne: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
            
            
        ]
        let attributeTwo: [NSAttributedString.Key: Any] = [
            .foregroundColor: textColor,
            .font: UIFont.systemFont(ofSize: CGFloat(fontSize))

        ]
        
        let string = NSAttributedString(string: "Element: \(element)  \n", attributes: attributeOne)
        let string2 = NSAttributedString(string: source, attributes: attributeTwo)
        let finalAttributedString = NSMutableAttributedString()
        finalAttributedString.append(string)
        finalAttributedString.append(string2)
        tx.attributedText = finalAttributedString
        stackView.addArrangedSubview(tx)
    }

    
    func buildImageArea(elementNumber :Int, sourceImg: String, height: Int, width: Int){
        let elementTextView2 = TextView()
        let attributeOne: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: CGFloat(17))
        ]
        let element = String(elementNumber)
        let fullString = NSMutableAttributedString(string: "Element: \(element)  \n", attributes: attributeOne)
        let image1Attachment = NSTextAttachment()
        //let imgString = sourceImg + ".png"
        let imgUrl :UIImage = refVm.getImageDataFrom(url: sourceImg)
        //image1Attachment.image = UIImage(named: imgString)
        image1Attachment.bounds = CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height))
        image1Attachment.image = imgUrl
        
        let image1String = NSAttributedString(attachment: image1Attachment) 
        
        fullString.append(image1String)
        
        elementTextView2.attributedText = fullString
        stackView.addArrangedSubview(elementTextView2)
    }
    
    
    
    func setStackViewConstraints() {
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
       stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
       stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
       stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    

    @IBAction func addTapped(_ sender: Any) {
        showInputDialog()
    }
    
 
    func showInputDialog() {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Add row", message: "Your Message", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let confirmAction = UIAlertAction(title: "Enter", style: .default) { (_) in
            
            //getting the input values from user
            let content = alertController.textFields?[0].text
            let row = alertController.textFields?[1].text
            
            //self.insertUserInput(content: content!, index: row!)
            //print("Content: \(name ?? "NA") Number: \(email ?? "0")")
            if content!.trimmingCharacters(in: .whitespaces).isEmpty{
            } else{
                if row!.trimmingCharacters(in: .whitespaces).isEmpty || Int(row!.trimmingCharacters(in: .whitespaces))! >= self.indexNumber {
                            self.insertUserInput(content: content!, index: "\(self.indexNumber+1)")
                        }
                        else{
                            self.insertUserInput(content: content!, index: row!)
                        }
                 }
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        
        //adding textfields to our dialog box
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Content"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Enter Index"
        }
        
        //adding the action to dialogbox
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
        self.present(alertController, animated: true, completion: nil)
    }
    
    func insertUserInput(content: String, index: String){
        let index = Int(index)!-1
                let userInputTextView = TextView()
                userInputTextView.backgroundColor = refVm.hexStringToUIColor(hex: "#9ff8fc")
                userInputTextView.frame = CGRect(x: 10, y: 25, width: self.view.frame.width, height: 100)
                    let attributeOne: [NSAttributedString.Key: Any] = [
                        .font: UIFont.boldSystemFont(ofSize: CGFloat(17))
                    ]
                    let attributeTwo: [NSAttributedString.Key: Any] = [
                        .font: UIFont.systemFont(ofSize: CGFloat(17))

                    ]
                    
                let string2 = NSAttributedString(string: "User Input \n", attributes: attributeOne)
                let string = NSAttributedString(string: content, attributes: attributeTwo)
                let finalAttributedString = NSMutableAttributedString()
                finalAttributedString.append(string2)
                finalAttributedString.append(string)
        
                userInputTextView.attributedText = finalAttributedString
                indexNumber += 1
                stackView.insertArrangedSubview(userInputTextView, at: index)
    }
    
}

