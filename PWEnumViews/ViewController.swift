//
//  ViewController.swift
//  PWEnumViews
//
//  Created by Gabriel Morales on 8/17/16.
//  Copyright © 2016 Gabemdev. All rights reserved.
//

import UIKit

final class CallbackButton: UIView {
    let onTap: () -> ()
    let button: UIButton
    
    init(title: String, onTap: () -> ()) {
        self.onTap = onTap
        self.button = UIButton(type: .System)
        super.init(frame: .zero)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.constrainEdges(to: self)
        button.setTitle(title, forState: .Normal)
        button.addTarget(self, action: #selector(tapped), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tapped(sender: AnyObject) {
        onTap()
    }
}

final class CallbackImageButton: UIView {
    let onTap: () -> ()
    let button: UIButton
    
    init(image: UIImage, onTap: () -> ()) {
        self.onTap = onTap
        self.button = UIButton(type: .Custom)
        super.init(frame: .zero)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.constrainEdges(to: self)
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: #selector(tapped), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) hsd noy been implemented")
    }
    
    func tapped(sender: AnyObject) {
        onTap()
    }
}

final class CallbackRoundedImage: UIView {
    let onTap: () -> ()
    let button: UIButton
    
    init(image: UIImage, onTap: () -> ()) {
        self.onTap = onTap
        self.button = UIButton(type: .Custom)
        super.init(frame: .zero)
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.constrainEdges(to: self)
        button.layer.cornerRadius = button.frame.size.width / 2
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: #selector(tapped), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    func tapped(sender: AnyObject) {
        onTap()
    }
}

enum PWContentElement {
    case label(String)
    case button(String, () -> ())
    case imageButton(UIImage, () -> ())
    case roundedButton(UIImage, () -> ())
    case image(UIImage)
}

extension PWContentElement {
    var view: UIView {
        switch self {
        case .label(let text):
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            return label
        case .button(let text, let callback):
            return CallbackButton(title: text, onTap: callback)
        case .imageButton(let image, let callback):
            return CallbackImageButton(image: image, onTap: callback)
        case .roundedButton(let image, let callback):
            return CallbackRoundedImage(image: image, onTap: callback)
        case .image(let image):
            return UIImageView(image: image)
        }
    }
}

extension UIStackView {
    convenience init(elements: [PWContentElement]) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        axis = .Vertical
        spacing = 10
        
        for element in elements {
            addArrangedSubview(element.view)
        }
    }
}


class ViewController: UIViewController {
    
    var dynamicElements: [PWContentElement] = [
        .image(UIImage(imageLiteral: "pw_logo_HD")),
        .label("Welcome to Phunware! This is the new dynamic view."),
        .button("View on Github", {
            print("Button tapped")
        }),
        .label("If you're interested on continuing this project, please fork and contribute."),
        .imageButton(UIImage(imageLiteral: "pw_logo_HD"), {
            
        })
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        
        let stack = UIStackView(elements: dynamicElements)
        view.addSubview(stack)
        stack.constrainEqual(.Width, to: view)
        stack.center(in: view)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
