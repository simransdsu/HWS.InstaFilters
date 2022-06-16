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
    
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    
    @State private var currentFilter = CIFilter.sepiaTone()
    let content = CIContext()
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)
                    
                    Text(image == nil ? "Tap to select a picture" : "")
                        .foregroundColor(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture(perform: onTapSelectPictureView)
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { newValue in
                            applyProcess()
                        }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    Spacer()
                    Button("Save", action: saveImage)
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("InstaFilter")
            .onChange(of: inputImage) { _ in
                loadImage()
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        
        guard let inputImage = inputImage else {
            return
        }
        
        image = Image(uiImage: inputImage)
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcess()
    }
    
    func onTapSelectPictureView() {
        showingImagePicker = true
    }
    
    func saveImage() {
        
    }
    
    func changeFilter() {
        
    }
    
    func applyProcess() {
        currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        if let cgImage = content.createCGImage(outputImage, from: outputImage.extent)  {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
