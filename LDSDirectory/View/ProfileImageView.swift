//
//  ProfileImageView.swift
//  LDSDirectory
//
//  Created by Carlos Bastida on 7/5/23.
//
// 
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
