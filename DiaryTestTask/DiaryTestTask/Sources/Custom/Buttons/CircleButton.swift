//
//  CircleButton.swift
//  DiaryTestTask
//
//  Created by ilya on 05.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation
import UIKit

class CircleButton: UIButton {
    
    convenience init(type: UIButton.ButtonType) {
        self.init(type: type)
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    override var clipsToBounds: Bool {
        didSet {
            layer.cornerRadius = 0.5*self.bounds.size.height
        }
    }
}
