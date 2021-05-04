//
//  Actions.swift
//  DiaryTestTask
//
//  Created by ilya on 04.05.2021.
//  Copyright © 2021 ilya. All rights reserved.
//

import Foundation

final public class ProjectActions {
    
    public static let shared = ProjectActions()
    
    func getJSONFile<T: Decodable> (fileName: String) -> T? {
        
        var resault: T? = nil
        if let path = Bundle.main.path(forResource: fileName + ".json", ofType: nil) {
        let url = URL(fileURLWithPath: path)
         do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            resault = jsonData
             } catch {
                 print("error:\(error)")
             }
         }
        return resault
    }
}
