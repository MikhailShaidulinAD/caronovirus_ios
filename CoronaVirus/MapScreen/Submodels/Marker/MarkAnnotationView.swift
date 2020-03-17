//
//  MarkerView.swift
//  CoronaVirus
//
//  Created by ShaydulinsIOS on 17.03.2020.
//  Copyright © 2020 ShaydulinsIOS. All rights reserved.
//

import UIKit

class MarkAnnotationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    convenience init(frame: CGRect, mark: String, freeBoxes: Int) {
        if freeBoxes > 10000 {
            self.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        }else if freeBoxes > 100000{
            self.init(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        }else{
            self.init(frame: frame)
        }
        customInit(mark: mark, freeBoxes: freeBoxes)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var contentView: UIView!
    
    let testText: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .white
        view.textAlignment = .center
        return view
    }()
    
    let busyBoxColor = UIColor(red: 1, green: 230/255, blue: 5/255, alpha: 1)
    let freeBoxColor = UIColor(red: 200/255, green: 201/255, blue: 199/255, alpha: 0.35)
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func customInit(mark: String = "0", freeBoxes: Int = 1){
        Bundle.main.loadNibNamed("MarkAnnotationXib", owner: self, options: nil)
        self.backgroundColor = .orange
        self.layer.cornerRadius = self.frame.width / 2
        addSubview(contentView)
        contentView.widthAnchor.constraint(equalToConstant: self.frame.width).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        ratingLabel.text = mark
        ratingLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        ratingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        ratingLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2).isActive = true
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.layoutIfNeeded()
        
    }
    
    func getImage() ->UIImage{
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { ctx in
            self.contentView.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
    
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }


}
