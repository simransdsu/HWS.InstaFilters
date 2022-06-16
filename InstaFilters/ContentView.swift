//
//  ContentView.swift
//  InstaFilters
//
//  Created by Simran Preet Narang on 2022-06-14.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputImage: UIImage?
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    
    @State private var showingImagePicker = false
    
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
    }
    
    func onTapSelectPictureView() {
        showingImagePicker = true
    }
    
    func saveImage() {
        
    }
    
    func changeFilter() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
