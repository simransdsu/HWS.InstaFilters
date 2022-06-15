//
//  ImagePicker.swift
//  InstaFilters
//
//  Created by Simran Preet Narang on 2022-06-15.
//

import PhotosUI
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = PHPickerViewController
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
}
