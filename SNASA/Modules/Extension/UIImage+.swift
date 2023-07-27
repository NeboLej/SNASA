//
//  UIImage+.swift
//  SNASA
//
//  Created by Nebo on 27.07.2023.
//

import UIKit
import Alamofire

extension UIImage {
    class func load(by url: String, completionHandler: @escaping (_ image: UIImage?) -> (), progress: @escaping (_ progress: Double) -> ()) {
        AF.download(url)
            .downloadProgress { prog in
                progress(prog.fractionCompleted)
            }
            .responseData { response in
            if let data = response.value {
                let imageData = UIImage(data: data)
                completionHandler(imageData)
            } else {
                completionHandler(nil)
            }
        }
    }
}
