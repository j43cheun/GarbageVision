//
//  GarbageVisionView.swift
//  GarbageVision
//
//  Created by Justin Cheung on 12/24/20.
//

import SwiftUI

struct GarbageVisionView: View {

    @State
    private var showImageSources: Bool

    init() {
        self._showImageSources = .init(initialValue: false)
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                self.showImageSourcesButton()
            }.navigationBarTitle("Select a Photo")
        }
    }

    func showImageSourcesButton() -> some View {
        Button(action: {
            self.showImageSources = true
        }, label: {
            Image(systemName: "viewfinder")
                .font(.system(.title2))
                .frame(width: 70, height: 70)
                .foregroundColor(Color.white)
        })
        .background(Color.blue)
        .cornerRadius(38.5)
        .shadow(color: Color.black.opacity(0.3),
                radius: 3,
                x: 3,
                y: 3)
        .actionSheet(isPresented: self.$showImageSources) {
            self.imageSources()
        }
    }

    func imageSources() -> ActionSheet {
        ActionSheet(title: Text("Image Source"), buttons: [
            .default(Text("Camera")) {
                // TODO
            },
            .default(Text("File")) {
                // TODO
            },
            .cancel()
        ])
    }
}
