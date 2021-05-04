//
//  UITableView.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell> (_ cell: T.Type) {
        self.register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellReuseIdentifier: String(describing: cell.self))
    }
    
    func dequeueReusableCell<T: UITableViewCell> (for indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
    }
}
