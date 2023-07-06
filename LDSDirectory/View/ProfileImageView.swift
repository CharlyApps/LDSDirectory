//
//  ProfileImageView.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//
// This class was created in order to retrieve the image from the URL and assign a custom View into the ContentView element for image, however for good of the test i rather use a library SDWebImage that handles cache, still leave this class here just so we can take a look at the first approach
import Foundation
import SwiftUI

struct ProifleImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let profileImage = UIImage(data: data) {
            Image(uiImage: profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100)
                .background(Color.gray)
        } else {
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .background(Color.gray)
                .onAppear {
                    fetchIamge()
                }
        }
    }
    
    private func fetchIamge() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let imageTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        imageTask.resume()
    }
}
