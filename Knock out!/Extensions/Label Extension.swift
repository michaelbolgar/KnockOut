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
        label.textAlignment = .center
        return label
    }

    static func makeHelpLabel(text: String = "") -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 17)
//        label.backgroundColor = .yellow
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
}
