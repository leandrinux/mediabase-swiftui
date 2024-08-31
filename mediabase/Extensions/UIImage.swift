//
//  UIImage.swift
//  mediabase
//
//  Created by Leandro on 29/08/2024.
//

import UIKit

public extension UIImage {
    
    // https://stackoverflow.com/questions/26542035/how-to-create-a-uiimage-with-solid-color
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
}
