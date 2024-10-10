//
//  ImageBlur.swift
//  ToolGather
//
//  Created by 于浏洋 on 2023/8/11.
//

import Foundation

class ImageBlur: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let imageWidth = SCREENWIDTH
        let imageHeight = SCREENWIDTH*50/89
        
        let frame1 = CGRect.init(x: 0, y: (SCREENHEIGHT - (imageHeight + 200)) / 2.0, width: imageWidth, height: imageHeight + 200)
        let blurImageView1 = UIImageView(frame: frame1)
        let blurredImage = applyGaussianBlur(to: UIImage(named: "美女图") ?? UIImage())
        blurImageView1.image = blurredImage
        blurImageView1.contentMode = .scaleAspectFill
        blurImageView1.clipsToBounds = true
        self.view.addSubview(blurImageView1)

        let frame = CGRect.init(x: 0, y: (SCREENHEIGHT - imageHeight) / 2.0, width: imageWidth, height: imageHeight)
        let orignImageView = UIImageView(frame: frame)
        orignImageView.image = UIImage(named: "美女图")
        orignImageView.contentMode = .scaleAspectFit
        self.view.addSubview(orignImageView)
 
        

    }
    
    func applyGaussianBlur(to image: UIImage) -> UIImage? {
        if let inputImage = CIImage(image: image) {
            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(inputImage, forKey: kCIInputImageKey)
            filter?.setValue(50.0, forKey: kCIInputRadiusKey) // 调整模糊程度
            
            if let outputImage = filter?.outputImage {
                let context = CIContext(options: nil)
                if let cgImage = context.createCGImage(outputImage, from: inputImage.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        return nil
    }
}

