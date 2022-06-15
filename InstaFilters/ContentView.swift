//
//  ContentView.swift
//  InstaFilters
//
//  Created by Simran Preet Narang on 2022-06-14.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear {
            loadImage()
        }
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "1") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.sepiaTone()
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1.0
        
        guard let outputCIImage =  currentFilter.outputImage else { return }
        guard let outputCGImage = context.createCGImage(outputCIImage, from: outputCIImage.extent) else { return }
        let outputImage = UIImage(cgImage: outputCGImage)
        image = Image(uiImage: outputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
