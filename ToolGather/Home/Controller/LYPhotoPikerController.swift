//
//  LYPhotoPiker.swift
//  ToolGather
//
//  Created by 于浏洋 on 2023/8/1.
//

import UIKit
//import HXPhotoPicker

class LYPhotoPikerController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        presentPickerController()
    }

//    func presentPickerController() {
        // 设置与微信主题一致的配置
//        let config = PickerConfiguration.default
//
//        // 方法二：
//        let pickerController = PhotoPickerController(picker: config)
//        pickerController.pickerDelegate = self
////        // 当前被选择的资源对应的 PhotoAsset 对象数组
////        pickerController.selectedAssetArray = selectedAssets
////        // 是否选中原图
////        pickerController.isOriginal = isOriginal
//        present(pickerController, animated: true, completion: nil)
//
////        // 方法三：
////        Photo.picker(
////            config
////        ) { result, pickerController in
////            // 选择完成的回调
////            // result 选择结果
////            //  .photoAssets 当前选择的数据
////            //  .isOriginal 是否选中了原图
////            // photoPickerController 对应的照片选择控制器
////        } cancel: { pickerController in
////            // 取消的回调
////            // photoPickerController 对应的照片选择控制器
////        }
//    }
}

//extension LYPhotoPikerController: PhotoPickerControllerDelegate {
//
//    /// 选择完成之后调用
//    /// - Parameters:
//    ///   - pickerController: 对应的 PhotoPickerController
//    ///   - result: 选择的结果
//    ///     result.photoAssets  选择的资源数组
//    ///     result.isOriginal   是否选中原图
//    func pickerController(
//        _ pickerController: PhotoPickerController,
//        didFinishSelection result: PickerResult
//    ) {
//        // async/await
////        let images: [UIImage] = try await result.objects()
////        let urls: [URL] = try await result.objects()
////        let urlResults: [AssetURLResult] = try await result.objects()
////
////        result.getImage { (image, photoAsset, index) in
////            if let image = image {
////                print("success", image)
////            }else {
////                print("failed")
////            }
////        } completionHandler: { (images) in
////            print(images)
////        }
//    }
//
//    /// 点击取消时调用
//    /// - Parameter pickerController: 对应的 PhotoPickerController
//    func pickerController(didCancel pickerController: PhotoPickerController) {
//
//    }
//}
