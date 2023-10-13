// можно удалить

import Foundation
import UIKit

final class DefaultHelpLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .black
        numberOfLines = 0
        font = UIFont(name: "DelaGothicOne-Regular", size: 17)
        textAlignment = .center
    }
}
