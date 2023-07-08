//
//  TmpService.swift
//  SNASA
//
//  Created by Nebo on 08.07.2023.
//

import Foundation

class TmpService {
    
    func loadDate(completion: @escaping (Date) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(Date())
        }
    }
    
    func loadTwo(completion: @escaping (Int) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(2)
        }
    }
    
    func loadImage(completion: @escaping (String) -> Void) {
        
    }
}
