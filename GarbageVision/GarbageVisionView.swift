//
//  GarbageVisionView.swift
//  GarbageVision
//
//  Created by Justin Cheung on 12/24/20.
//

import SwiftUI

struct GarbageVisionView: View {

    @ObservedObject
    var classifier: GarbageClassifier

    @State
    private var showImageSources: Bool

    @State
    private var showImagePicker: Bool

    @State
    private var imagePickerSourceType: UIImagePickerController.SourceType

    init() {
        self.classifier = GarbageClassifier()
        self._showImageSources = .init(initialValue: false)
        self._showImagePicker = .init(initialValue: false)
        self._imagePickerSourceType = .init(initialValue: UIImagePickerController.SourceType.photoLibrary)
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if self.classifier.isProcessing {
                        Text("Please wait...")
                            .font(.system(size: 11))
                            .foregroundColor(.secondary)
                    } else {
                        if let image = self.classifier.image {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 300)
                                .padding()
                            Spacer()
                        } else {
                            Text("Press the button below to identify garbage")
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .zIndex(0)
                VStack {
                    Spacer()
                    self.identifyImageButton
                        .actionSheet(isPresented: self.$showImageSources) {
                            self.imageSources
                        }
                        .sheet(isPresented: self.$showImagePicker) {
                            self.imagePicker
                        }
                }
                .zIndex(1)
            }
            .navigationBarTitle(self.navigationBarTitle)
        }
    }

    var navigationBarTitle: String {
        var title = "Garbage Vision"

        if self.classifier.isProcessing {
            title = "Loading..."
        } else
        if self.classifier.label != nil {
            title = self.classifier.label!
        }

        return title.capitalized
    }

    var identifyImageButton: some View {
        Button(action: {
            self.showImageSources = true
        }, label: {
            ZStack {
                Image(systemName: "viewfinder")
                    .font(.system(.largeTitle))
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color.white)
                Image(systemName: "trash.fill")
                    .font(.system(.title3))
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color.white)
            }
        })
        .background(Color.blue)
        .cornerRadius(38.5)
    }

    var imageSources: ActionSheet {
        ActionSheet(title: Text("Image Source"), buttons: self.imageSourceOptions)
    }

    var imageSourceOptions: [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            buttons.append(.default(Text("Camera")) {
                self.imagePickerSourceType = .camera
                self.showImagePicker = true
            })
        }

        buttons.append(.default(Text("File")) {
            self.imagePickerSourceType = .photoLibrary
            self.showImagePicker = true
        })

        buttons.append(.cancel())

        return buttons
    }

    var imagePicker: ImagePicker {
        ImagePicker(sourceType: self.imagePickerSourceType) { image in
            if image != nil {
                self.classifier.classify(image: image!)
            }

            self.showImagePicker = false
        }
    }
}
