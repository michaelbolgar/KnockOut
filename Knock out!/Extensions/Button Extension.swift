import Foundation
import UIKit

extension UIButton {

    static func makeButton(text: String = "", color: UIColor, font: UIFont?, textColor: UIColor, radius: Int, borderWidth: Int, borderColor: UIColor) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(borderColor, for: .normal)
        button.layer.borderWidth = CGFloat(borderWidth)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = CGFloat(radius)
        return button
    }
}
