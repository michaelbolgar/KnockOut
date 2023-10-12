import Foundation
import UIKit

extension UILabel {

    static func makeLabel(text: String = "", font: UIFont?, textColor: UIColor, numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
//        label.backgroundColor = .yellow
        label.textColor = textColor
        label.numberOfLines = numberOfLines
        label.adjustsFontSizeToFitWidth = true
        label.clipsToBounds = true
        return label
    }
}
